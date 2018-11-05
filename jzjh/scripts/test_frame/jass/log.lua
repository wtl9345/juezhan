---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/5 9:30
---

local log = {}

log.path = 'F:\\log.txt'
log.level = 'info'

local level = {
    debug = 1,
    info = 2,
    warn = 3,
    error = 4,
}

local function write(...)
    local mode = "a+b"
    local file = io.open(log.path, mode)
    if file then
        if file:write(...) == nil then
            return false
        end
        file:write('\n')
        io.close(file)
        return true
    else
        return false
    end
end

function log.debug(...)
    if level[log.level] <= level.debug then
        print('[DEBUG]', os.date('%X'), ...)
        write('[DEBUG]', os.date('%X'), ...)
    end
end

function log.info(...)
    if level[log.level] <= level.info then
        print('[INFO]', os.date('%X'), ...)
        write('[INFO]', os.date('%X'), ...)
    end
end

function log.warn(...)
    if level[log.level] <= level.warn then
        print('[WARN]', os.date('%X'), ...)
        write('[WARN]', os.date('%X'), ...)
    end
end

function log.error(...)
    if level[log.level] <= level.error then
        print('[ERROR]', os.date('%X'), ...)
        write('[ERROR]', os.date('%X'), ...)
    end
end

return log