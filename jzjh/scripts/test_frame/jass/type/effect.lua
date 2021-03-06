---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/2 9:48
---

local common_util = require 'jass.util.common_util'
local effect = {}
effect.all_effects = {}

local mt = {}
effect.__index = mt

mt.type = 'effect'
mt.model = ''
mt.x = 0
mt.y = 0

function mt:destroy()
    effect.all_effects[self.handle_id] = nil
end

function effect.create_for_position(model, x, y)
    local e = setmetatable({}, effect)
    e.handle_id = common_util.generate_handle_id()
    e.model = model
    e.x = x
    e.y = y
    effect.all_effects[e.handle_id] = e
    return e
end

function effect.create_for_widget(model, handle, attach_point)
    local e = setmetatable({}, effect)
    e.handle_id = common_util.generate_handle_id()
    e.model = model
    e.handle = handle
    e.attach_point = attach_point
    effect.all_effects[e.handle_id] = e
    return e
end

return effect