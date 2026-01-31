--[[
    🐺 LXR Radial Menu v2.0 - Server
    Modern server-side logic with security
    
    © 2026 iBoss | www.wolves.land
]]

-- Load shared modules
local Constants = require 'shared.constants'
local Utils = require 'shared.utils'

-- ═══════════════════════════════════════════════════════════════
-- DATABASE (Optional - for persistent settings)
-- ═══════════════════════════════════════════════════════════════

local PlayerSettings = {}

--- Load player settings from database
---@param identifier string Player identifier
---@return table Settings
local function LoadPlayerSettings(identifier)
    -- Implement based on your database system
    -- Example: MySQL, oxmysql, ghmattimysql, etc.
    
    -- For now, return default settings
    return {
        theme = Config.Theme.current,
        animationSpeed = 'normal',
        soundEnabled = true,
        blurEnabled = true,
        tooltipsEnabled = true
    }
end

--- Save player settings to database
---@param identifier string Player identifier
---@param settings table Settings to save
local function SavePlayerSettings(identifier, settings)
    -- Implement based on your database system
    
    if Config.Debug then
        Utils.Log('Settings saved for: ' .. identifier, 'success')
    end
end

-- ═══════════════════════════════════════════════════════════════
-- EVENTS
-- ═══════════════════════════════════════════════════════════════

--- Handle settings sync request
RegisterNetEvent(Constants.EVENTS.SERVER.SYNC_SETTINGS)
AddEventHandler(Constants.EVENTS.SERVER.SYNC_SETTINGS, function(settings)
    local source = source
    local identifier = GetPlayerIdentifier(source)
    
    if settings then
        -- Save settings
        PlayerSettings[identifier] = settings
        SavePlayerSettings(identifier, settings)
        
        if Config.Debug then
            Utils.Log('Settings synced for player ' .. source, 'info')
        end
    else
        -- Load and send settings
        local loadedSettings = LoadPlayerSettings(identifier)
        PlayerSettings[identifier] = loadedSettings
        
        TriggerClientEvent(Constants.EVENTS.SERVER.SYNC_SETTINGS, source, loadedSettings)
    end
end)

--- Handle action logging
RegisterNetEvent(Constants.EVENTS.SERVER.LOG_ACTION)
AddEventHandler(Constants.EVENTS.SERVER.LOG_ACTION, function(action, itemId)
    local source = source
    local identifier = GetPlayerIdentifier(source)
    local playerName = GetPlayerName(source)
    
    if Config.Debug then
        Utils.Log(string.format('[Action] %s (%s) - %s', playerName, identifier, action), 'info')
    end
    
    -- Log to your logging system (database, file, etc.)
    -- Example: INSERT INTO radial_menu_logs (player, action, timestamp) VALUES (...)
end)

-- ═══════════════════════════════════════════════════════════════
-- PLAYER MANAGEMENT
-- ═══════════════════════════════════════════════════════════════

--- Handle player connecting
AddEventHandler('playerConnecting', function()
    local source = source
    local identifier = GetPlayerIdentifier(source)
    
    -- Load player settings
    PlayerSettings[identifier] = LoadPlayerSettings(identifier)
end)

--- Handle player dropped
AddEventHandler('playerDropped', function()
    local source = source
    local identifier = GetPlayerIdentifier(source)
    
    -- Clean up player data
    if PlayerSettings[identifier] then
        PlayerSettings[identifier] = nil
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════

--- Get player identifier
---@param source number Player source
---@return string Identifier
function GetPlayerIdentifier(source)
    local identifiers = GetPlayerIdentifiers(source)
    
    for _, id in ipairs(identifiers) do
        if string.find(id, 'license:') then
            return id
        end
    end
    
    return 'unknown'
end

--- Check if player has permission
---@param source number Player source
---@param permission string Permission name
---@return boolean Has permission
function HasPermission(source, permission)
    -- Implement based on your permission system
    -- Examples: ace permissions, group system, framework permissions
    
    -- For now, return true (all players have access)
    return true
end

-- ═══════════════════════════════════════════════════════════════
-- COMMANDS
-- ═══════════════════════════════════════════════════════════════

--- Command: Open radial menu
RegisterCommand('radialmenu', function(source, args, rawCommand)
    TriggerClientEvent(Constants.EVENTS.CLIENT.OPEN_MENU, source)
end, false)

--- Command: Reload menu (admin only)
RegisterCommand('reloadmenu', function(source, args, rawCommand)
    if not HasPermission(source, 'admin') then
        return
    end
    
    -- Reload configuration (if using hot reload)
    TriggerClientEvent(Constants.EVENTS.CLIENT.REFRESH_MENU, -1)
    
    Utils.Log('Menu reloaded by admin', 'success')
end, true)

-- ═══════════════════════════════════════════════════════════════
-- EXPORTS
-- ═══════════════════════════════════════════════════════════════

--- Export: Get player settings
---@param source number Player source
---@return table Settings
exports('GetPlayerSettings', function(source)
    local identifier = GetPlayerIdentifier(source)
    return PlayerSettings[identifier] or {}
end)

--- Export: Check player permission
---@param source number Player source
---@param permission string Permission name
---@return boolean Has permission
exports('HasPermission', function(source, permission)
    return HasPermission(source, permission)
end)

-- ═══════════════════════════════════════════════════════════════
-- STARTUP
-- ═══════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(1000)
    
    Utils.Log('═══════════════════════════════════════════════════', 'info')
    Utils.Log('    LXR Radial Menu v' .. Constants.VERSION, 'success')
    Utils.Log('    © 2026 iBoss | www.wolves.land', 'info')
    Utils.Log('═══════════════════════════════════════════════════', 'info')
    Utils.Log('Server initialized successfully', 'success')
    
    if Config.Debug then
        Utils.Log('Debug mode enabled', 'warn')
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- CLEANUP
-- ═══════════════════════════════════════════════════════════════

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    
    -- Save all player settings before shutdown
    for identifier, settings in pairs(PlayerSettings) do
        SavePlayerSettings(identifier, settings)
    end
    
    Utils.Log('Resource stopped - All settings saved', 'warn')
end)
