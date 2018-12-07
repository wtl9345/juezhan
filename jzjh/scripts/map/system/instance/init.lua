---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/12/4 17:20
---

log.info('加载副本系统')

require 'map.system.instance.instance_one'
require 'map.system.instance.instance_two'
require 'map.system.instance.instance_three'
require 'map.system.instance.instance_four'
require 'map.system.instance.instance_five'
require 'map.system.instance.instance_six'
require 'map.system.instance.instance_wild'

--- 江湖武功的set
wild_kungfus = set:new { 1227895626, 1227895624, 1227895623, 1227895627, 1227895628, 1227895621, 1227895603, 1227895622 }

--- 江湖内功的set
wild_internals = set:new { 1227895382, 1227895381, 1227895386, 1227895385, 1227895620, 1227895600, 1227895601, 1227895383 }

--- 绝学的set
outstanding_kungfus = set:new { 1227895609, 1227895604, 1227895608, 1227895607, 1227895618, 1227895602, 1227895605, 1227895606, 1227895619, 1227895617, }

--- 绝内的set
outstanding_internals = set:new { 1227895635, 1227895629, 1227895637, 1227895634, 1227895632, 1227895633, 1227895631, 1227895636 }

--- 残章的set
remnant_chapters = set:new { 1227896373, 1227896369, 1227896374, 1227896372, 1227896375, 1227896370, 1227896377, 1227896368, 1227896376, 1227896371, 1227899735, }

--- @param unit_id number|table 单位ID列表
--- @param ... table<number|table, number>
function drop_item(unit_id, ...)
    if type(unit_id) == 'number' then
        unit_id = { unit_id }
    end
    --- @param killer unit
    --- @param killed unit
    et.game:event '单位-死亡'(function(self, killer, killed)
        if is_in(killed:get_type_id(), unit_id) then
            local args = { ... }
            local x, y = killed:get_point():get()
            for _, drop_table in pairs(args) do
                local rand = commonutil.random(0, 100)
                local accumulate = 0
                for id, possibility in pairs(drop_table) do
                    if accumulate + rand < possibility then
                        if type(id) == 'number' then
                            et.item:new(id, x, y)
                        else
                            --- @type set
                            local set = id
                            et.item:create(set:random(), x, y)
                        end
                        break
                    else
                        accumulate = accumulate + possibility
                    end
                end
            end
        end
    end)
end

instance_info = {
    -- FB1
    --[1227895366] = {
    --    name = '马贼洞',
    --    gold = 100,
    --    pratice = 0,
    --    previous_pratice_rect = Te,
    --    enter_rect = Ze,
    --    mystery_rect = ef,
    --
    --}
    { in_progress = false, countdown = 150 },
    { in_progress = false, countdown = 150 },
    { in_progress = false, countdown = 150 },
    { in_progress = false, countdown = 150 },
    { in_progress = false, countdown = 150 },
    { in_progress = false, countdown = 150 },
}

--- 载入神秘怪物
--- @param num number
--- @param point point
--- @param mystery_set set
local function load_mystery(num, point, mystery_set)
    if commonutil.random_int(1, 100) <= 20 or mystery_set:is_empty() then
        force.send_message("|cFFFFCC33载入神秘怪物：|cFF33FFFF无", 30)
        instance_info[num].mystery = "无"
    else
        local last = et.player[13]:create_unit(mystery_set:random(), point)
        force.send_message("|cFFFFCC33载入神秘怪物：|cFF33FFFF" .. last:get_name(), 30)
        instance_info[num].mystery = last:get_name()
    end
end

--- @param num number
--- @param rare_drop_set set 稀有掉落物品id集合
local function load_rare_drop(num, rare_drop_set)
    if commonutil.random_int(1, 100) <= 20 or rare_drop_set:is_empty() then
        force.send_message("|cFFFFCC33载入稀有掉落：|cFF33FFFF无", 30)
        instance_info[num].rare_drop = "无"
    else
        local rare_drop_id = rare_drop_set:random()
        force.send_message("|cFFFFCC33载入稀有掉落：|cFF33FFFF" .. jass.GetObjectName(rare_drop_id), 30)
        instance_info[num].rare_drop_id = rare_drop_id
        instance_info[num].rare_drop = jass.GetObjectName(rare_drop_id)
    end
end

--- @param num number
--- @param npc_set set
--- @param npc_point_set set
local function load_unusual_npc(num, npc_set, npc_point_set)
    if commonutil.random_int(1, 100) <= 50 or npc_set:is_empty() then
        force.send_message("|cFFFFCC33载入奇缘NPC：|cFF33FFFF无", 30)
        instance_info[num].unusual_npc = '无'
    else
        local last = et.player[16]:create_unit(npc_set:random(), npc_point_set:random())
        last:add_approach_listener()
        force.send_message("|cFFFFCC33载入奇缘NPC：|cFF33FFFF" .. last:get_name(), 30)
        instance_info[num].unusual_npc = last:get_name()
    end
end

--- @param instance {num:number, item_id:number, name:string, gold:number, practice:number, practice_point:point, enter_point:point, mystery_point:point, mystery_set:set, rare_drop_set:set, npc_set:set, npc_point_set:set}
function enter_instance_listener(instance)
    --- @param u unit
    --- @param it item
    et.game:event '单位-捡起物品'(function(self, u, it)
        if it:get_id() ~= instance.item_id then
            return
        end
        local p = u:get_owner()
        if not u:is_hero() then
            p:add_gold(instance.gold)
            p:send_message("|cFFFFCC00只能由主角亲自前往副本")
            return
        end
        local h = p.hero
        if h.practice < instance.pratice then
            p:add_gold(instance.gold)
            p:send_message("|cFFFFCC00修行达到" .. instance.practice .. "才可以进入,你的修行不足，请前往地图指示点修行去吧")
            local x, y = instance.pratice_point:get()
            force.ping_minimap(x, y, 5)
            return
        end
        if not instance_info[instance.num].in_progress then
            force.send_message("|cFFFFCC00开始载入动态副本：|r |cFF99FFCC" .. instance.name .. "|r", 30)
            force.send_message("|cFFcc99ff――――――――――", 30)
            load_mystery(instance.num, instance.mystery_point, instance.mystery_set)
            load_rare_drop(instance.num, instance.rare_drop_set)
            load_unusual_npc(instance.num, instance.npc_set, instance.npc_point_set)
            instance_info[instance.num].in_progress = true
            et.timer(1000, 150, function()
                instance_info[instance.num].countdown = instance_info[instance.num].countdown - 1
            end)
            p:send_message("|cFFFF0033副本重置倒计时：|cFF33FFFF" .. instance_info[instance.num].countdown .. "秒")
            et.wait(150 * 1000, function()
                instance_info[instance.num].countdown = 150
                instance_info[instance.num].in_progress = false
            end)
        else
            force.send_message("|cFFFFCC00进入动态副本：|r |cFF99FFCC" .. (FBName or "") .. "|r", 30)
            force.send_message("|cFFcc99ff――――――――――", 30)
            force.send_message("|cFFFFCC33神秘怪物：|cFF33FFFF" .. instance_info[instance.num].mystery, 30)
            force.send_message("|cFFFFCC33稀有掉落：|cFF33FFFF" .. instance_info[instance.num].rare_drop, 30)
            force.send_message("|cFFFFCC33载入奇缘NPC：|cFF33FFFF" .. instance_info[instance.num].unusual_npc, 30)
            force.send_message("|cFFFF0033副本重置倒计时：|cFF33FFFF" .. instance_info[instance.num].countdown .. "秒")
        end
        u:set_point(instance.enter_point)
        p:set_camera(u:get_point())
    end)
end

--- @param from rect 从哪个区域跳转
--- @param to rect 跳转到的区域
function jump_in_maze(from, to)
    et.game:event '单位-进入区域'(function(self, u, r)
        if not u:is_hero() then
            return
        end
        if r == from then
            u:set_point(to:get_center())
            u:get_owner():set_camera(to:get_center())
        end
    end)
end

