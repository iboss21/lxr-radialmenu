--[[
    🐺 LXR Radial Menu - Utility Functions
    Common utility functions for both client and server
]]

Utils = {}

--- Print a formatted debug message
---@param message string The message to print
---@param level string The log level (info, warn, error, success)
function Utils.Log(message, level)
    level = level or 'info'
    
    local prefix = '^7[^2LXR-RadialMenu^7]'
    local colorCode = '^7'
    
    if level == 'error' then
        colorCode = '^1'
    elseif level == 'warn' then
        colorCode = '^3'
    elseif level == 'success' then
        colorCode = '^2'
    elseif level == 'info' then
        colorCode = '^5'
    end
    
    print(prefix .. ' ' .. colorCode .. message .. '^7')
end

--- Deep copy a table
---@param original table The table to copy
---@return table The copied table
function Utils.DeepCopy(original)
    local copy
    if type(original) == 'table' then
        copy = {}
        for k, v in next, original, nil do
            copy[Utils.DeepCopy(k)] = Utils.DeepCopy(v)
        end
        setmetatable(copy, Utils.DeepCopy(getmetatable(original)))
    else
        copy = original
    end
    return copy
end

--- Merge two tables
---@param t1 table First table
---@param t2 table Second table (overwrites t1)
---@return table Merged table
function Utils.MergeTables(t1, t2)
    local result = Utils.DeepCopy(t1)
    for k, v in pairs(t2) do
        if type(v) == 'table' and type(result[k]) == 'table' then
            result[k] = Utils.MergeTables(result[k], v)
        else
            result[k] = v
        end
    end
    return result
end

--- Check if a table contains a value
---@param tbl table The table to search
---@param value any The value to find
---@return boolean True if found
function Utils.TableContains(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

--- Get table size
---@param tbl table The table to count
---@return number The number of elements
function Utils.TableSize(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

--- Round a number to specified decimal places
---@param num number The number to round
---@param decimals number Number of decimal places
---@return number Rounded number
function Utils.Round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

--- Clamp a value between min and max
---@param value number The value to clamp
---@param min number Minimum value
---@param max number Maximum value
---@return number Clamped value
function Utils.Clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

--- Format time in seconds to MM:SS
---@param seconds number Time in seconds
---@return string Formatted time string
function Utils.FormatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local secs = math.floor(seconds % 60)
    return string.format('%02d:%02d', minutes, secs)
end

--- Check if a string is empty or nil
---@param str string The string to check
---@return boolean True if empty or nil
function Utils.IsEmpty(str)
    return str == nil or str == ''
end

--- Trim whitespace from string
---@param str string The string to trim
---@return string Trimmed string
function Utils.Trim(str)
    return str:match('^%s*(.-)%s*$')
end

--- Split string by delimiter
---@param str string The string to split
---@param delimiter string The delimiter
---@return table Array of strings
function Utils.Split(str, delimiter)
    local result = {}
    local pattern = string.format('([^%s]+)', delimiter)
    for match in string.gmatch(str, pattern) do
        table.insert(result, match)
    end
    return result
end

--- Generate a unique ID
---@return string Unique identifier
function Utils.GenerateId()
    local charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local id = ''
    for i = 1, 16 do
        local rand = math.random(1, #charset)
        id = id .. charset:sub(rand, rand)
    end
    return id .. '-' .. os.time()
end

--- Calculate distance between two 3D points
---@param x1 number X coordinate of first point
---@param y1 number Y coordinate of first point
---@param z1 number Z coordinate of first point
---@param x2 number X coordinate of second point
---@param y2 number Y coordinate of second point
---@param z2 number Z coordinate of second point
---@return number Distance between points
function Utils.GetDistance(x1, y1, z1, x2, y2, z2)
    local dx = x2 - x1
    local dy = y2 - y1
    local dz = z2 - z1
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

--- Execute a callback safely with error handling
---@param callback function The function to execute
---@param ... any Arguments to pass to the function
---@return boolean success Whether execution succeeded
---@return any result The result or error message
function Utils.SafeExecute(callback, ...)
    if type(callback) ~= 'function' then
        return false, 'Not a function'
    end
    
    local success, result = pcall(callback, ...)
    if not success then
        Utils.Log('Error executing callback: ' .. tostring(result), 'error')
        return false, result
    end
    
    return true, result
end

--- Debounce function calls
---@param func function The function to debounce
---@param delay number Delay in milliseconds
---@return function Debounced function
function Utils.Debounce(func, delay)
    local timer = nil
    return function(...)
        local args = {...}
        if timer then
            timer = nil
        end
        timer = true
        SetTimeout(delay, function()
            func(table.unpack(args))
            timer = nil
        end)
    end
end

return Utils
