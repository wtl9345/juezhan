---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/9 10:56
---

local gameevent = {}

local mt = {}
gameevent.__index = mt

mt.type = 'gameevent'
mt.name = ''

function gameevent.init()
    local gameevent_names={
        
    }
    for i = 1, #gameevent_names do
        local ge = {}
        ge.name = gameevent_names[i]
        setmetatable(ge, gameevent)
        table.insert(gameevent,ge )
    end
end

return gameevent