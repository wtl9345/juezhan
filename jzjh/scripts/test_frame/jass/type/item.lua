---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/2 9:42
---

local common_util = require 'jass.util.common_util'
local itemtype = require 'jass.type.itemtype'
local item = {}

local mt = {}
item.__index = mt
item.all_items = {}
item.removed_items = {}

mt.type = 'item'

-- alive removed invulnerable
mt.status = 'alive'

mt.owner = nil

mt.x = 0
mt.y = 0

mt.drop_on_death = false

mt.droppable = true

mt.pawnable = true

mt.hidden = false

mt.powerup = false

mt.itemtype = itemtype[0]

function mt:remove()
    self.status = 'removed'
    item.all_items[self.handle_id] = nil
    item.removed_items[self.handle_id] = self
end

function mt:get_type_id()
    return self.id
end

function mt:get_x()
    return self.x
end

function mt:get_y()
    return self.y
end

function mt:set_position(x, y)
    self.x = x
    self.y = y
end

function mt:set_droppable(flag)
    self.droppable = flag
end

function mt:set_pawnable(flag)
    self.pawnable = flag
end

function mt:get_owner()
    return self.owner
end

function mt:set_owner(p)
    self.owner = p
end

function mt:set_color(pc)
    if pc.color then
        self.color = pc.color
    end
end

function mt:set_drop_on_death(flag)
    self.drop_on_death = flag
end

function mt:set_invulnerable(flag)
    if flag then
        self.status = 'invulnerable'
    else
        self.status = 'alive'
    end
end

function mt:is_invulnerable()
    return self.status == 'invulnerable'
end

function mt:show(flag)
    self.hidden = not flag
end

function mt:is_visible()
    return not self.hidden
end

function mt:get_type()
    return self.itemtype
end

function item.create(id, x, y)
    local it = setmetatable({}, item)
    it.handle_id = common_util.generate_handle_id()
    item.all_items[it.handle_id] = it
    it.id = id
    it.x = x
    it.y = y
    return it
end

return item