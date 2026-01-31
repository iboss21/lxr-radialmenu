--[[
    🐺 LXR Radial Menu - Framework Bridge (Client)
    Unified interface for multiple frameworks
]]

FrameworkBridge = {}
FrameworkBridge.Name = nil
FrameworkBridge.Core = nil
FrameworkBridge.PlayerData = {}

local Constants = require 'shared.constants'
local Utils = require 'shared.utils'

--- Initialize framework detection
---@return boolean success Whether a framework was detected
function FrameworkBridge:Initialize()
    -- Detection order: LXRCore -> VORP -> RSG -> RedEM -> QBR -> Standalone
    local detectionOrder = {
        { name = 'lxrcore', resource = 'lxr-core', export = 'GetCoreObject' },
        { name = 'vorp', resource = 'vorp_core', export = 'getCore' },
        { name = 'rsg', resource = 'rsg-core', export = 'GetCoreObject' },
        { name = 'redem', resource = 'redem_roleplay', export = 'getSharedObject' },
        { name = 'qbr', resource = 'qbr-core', export = 'GetCoreObject' },
    }
    
    for _, framework in ipairs(detectionOrder) do
        if GetResourceState(framework.resource) == 'started' then
            self.Name = framework.name
            Utils.Log('Framework detected: ' .. framework.name, 'success')
            
            -- Initialize framework-specific code
            self:InitializeFramework(framework)
            return true
        end
    end
    
    -- Default to standalone
    self.Name = 'standalone'
    Utils.Log('Running in standalone mode', 'info')
    return true
end

--- Initialize specific framework
---@param framework table Framework configuration
function FrameworkBridge:InitializeFramework(framework)
    if framework.name == 'lxrcore' then
        exports[framework.resource]:GetCoreObject(function(core)
            self.Core = core
            self.PlayerData = core.Functions.GetPlayerData()
            
            -- Listen for player updates
            RegisterNetEvent('LXRCore:Client:OnPlayerLoaded', function()
                self.PlayerData = self.Core.Functions.GetPlayerData()
            end)
            
            RegisterNetEvent('LXRCore:Client:OnJobUpdate', function(job)
                self.PlayerData.job = job
            end)
        end)
        
    elseif framework.name == 'vorp' then
        TriggerEvent('getCore', function(core)
            self.Core = core
        end)
        
        TriggerEvent('vorp:getCharacter', function(user)
            self.PlayerData = user
        end)
        
    elseif framework.name == 'rsg' then
        self.Core = exports[framework.resource]:GetCoreObject()
        
        RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function()
            self.PlayerData = self.Core.Functions.GetPlayerData()
        end)
        
    elseif framework.name == 'redem' then
        TriggerEvent('redemrp:getSharedObject', function(obj)
            self.Core = obj
        end)
        
    elseif framework.name == 'qbr' then
        self.Core = exports[framework.resource]:GetCoreObject()
        
        RegisterNetEvent('QBR:Client:OnPlayerLoaded', function()
            self.PlayerData = self.Core.Functions.GetPlayerData()
        end)
    end
end

--- Get player job
---@return string Job name
function FrameworkBridge:GetPlayerJob()
    if self.Name == 'lxrcore' or self.Name == 'rsg' or self.Name == 'qbr' then
        return self.PlayerData.job and self.PlayerData.job.name or 'unemployed'
    elseif self.Name == 'vorp' then
        return self.PlayerData.job or 'unemployed'
    elseif self.Name == 'redem' then
        return self.PlayerData.getJob() or 'unemployed'
    end
    return 'unemployed'
end

--- Get player money
---@param account string Account type (cash, bank, gold)
---@return number Amount
function FrameworkBridge:GetPlayerMoney(account)
    account = account or 'cash'
    
    if self.Name == 'lxrcore' or self.Name == 'rsg' or self.Name == 'qbr' then
        if self.PlayerData.money then
            return self.PlayerData.money[account] or 0
        end
    elseif self.Name == 'vorp' then
        if account == 'cash' then
            return self.PlayerData.money or 0
        elseif account == 'gold' then
            return self.PlayerData.gold or 0
        end
    elseif self.Name == 'redem' then
        return self.PlayerData.getMoney() or 0
    end
    
    return 0
end

--- Show notification
---@param message string Message to display
---@param type string Notification type (success, error, info)
function FrameworkBridge:Notify(message, type)
    type = type or 'info'
    
    if self.Name == 'lxrcore' then
        self.Core.Functions.Notify(message, type)
    elseif self.Name == 'vorp' then
        self.Core.NotifyLeft('Radial Menu', message, 'generic_textures', 'tick', 3000)
    elseif self.Name == 'rsg' or self.Name == 'qbr' then
        self.Core.Functions.Notify(message, type)
    elseif self.Name == 'redem' then
        exports['redem_roleplay']:NotifyLeft('Radial Menu', message, 'generic_textures', 'tick', 3000)
    else
        -- Standalone fallback
        print('[Radial Menu] ' .. message)
    end
end

--- Get player identifier
---@return string Player identifier
function FrameworkBridge:GetPlayerIdentifier()
    if self.Name == 'lxrcore' or self.Name == 'rsg' or self.Name == 'qbr' then
        return self.PlayerData.citizenid or ''
    elseif self.Name == 'vorp' then
        return self.PlayerData.identifier or ''
    elseif self.Name == 'redem' then
        return self.PlayerData.getIdentifier() or ''
    end
    return GetPlayerServerId(PlayerId())
end

--- Check if player has permission
---@param permission string Permission to check
---@return boolean Has permission
function FrameworkBridge:HasPermission(permission)
    if self.Name == 'lxrcore' or self.Name == 'rsg' or self.Name == 'qbr' then
        return self.Core and self.Core.Functions.HasPermission(permission) or false
    elseif self.Name == 'vorp' then
        -- VORP permission check
        return true -- Implement based on VORP's system
    elseif self.Name == 'redem' then
        -- RedEM permission check
        return true -- Implement based on RedEM's system
    end
    return true -- Standalone - allow all
end

--- Trigger server callback
---@param eventName string Event name
---@param callback function Callback function
---@param ... any Event arguments
function FrameworkBridge:TriggerCallback(eventName, callback, ...)
    if self.Name == 'lxrcore' or self.Name == 'rsg' or self.Name == 'qbr' then
        self.Core.Functions.TriggerCallback(eventName, callback, ...)
    elseif self.Name == 'vorp' then
        self.Core.TriggerServerCallback(eventName, callback, ...)
    elseif self.Name == 'redem' then
        self.Core.TriggerServerCallback(eventName, callback, ...)
    else
        -- Standalone - simulate callback
        TriggerServerEvent(eventName, ...)
    end
end

return FrameworkBridge
