---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/8 10:47
---
local common_util = require 'jass.util.common_util'
local trigger = require 'jass.type.trigger'
local playerevent = require 'jass.type.playerevent'
local gameevent = require 'jass.type.gameevent'
local dialogevent = require 'jass.type.dialogevent'
local fgamestate = require 'jass.type.fgamestate'
local group = require 'jass.type.group'
local trigger_util = {}

-- @param boolexpr array triggercondition
function trigger_util.evaluate(conditions)
    local flag = true
    for _, v in pairs(conditions) do
        if v.fun then
            flag = flag and v.boolexpr.fun()
        end
    end
    return flag
end

function trigger_util.execute(actions)
    for _, v in pairs(actions) do
        v.fun()
    end
end

function trigger_util.trig_player_event(p, pe)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == pe then
                trigger.triggering = t
                trigger.player = p
                if trigger_util.evaluate(t.conditions) then
                    trigger_util.execute(t.actions)
                end
            end
        end
    end
end

function trigger_util.trig_player_chat_event(p, message)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == playerevent[16] then
                trigger.triggering = t
                trigger.player = p
                local flag = false
                if e.message == '' then
                    flag = true
                end
                if e.message ~= '' and e.exact and e.message == message then
                    flag = true
                end
                if e.message ~= '' and not e.exact and string.find(e.message, message) then
                    flag = true
                end
                if flag then
                    if trigger_util.evaluate(t.conditions) then
                        trigger_util.execute(t.actions)
                    end
                end
            end
        end
    end
end

-- @param tab 其他参数的table
function trigger_util.trig_player_unit_event(p, pue, u, tab)

    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == pue then
                group.filter_unit = u
                if not e.filter or e.filter() then
                    trigger.triggering = t
                    trigger.player = p
                    trigger.unit = u
                    if common_util.is_in_table(pue.name, { 'EVENT_PLAYER_HERO_LEVEL', 'EVENT_UNIT_HERO_LEVEL' }) then
                        trigger.leveling_unit = u
                    end
                    if common_util.is_in_table(pue.name, { 'EVENT_PLAYER_HERO_SKILL', 'EVENT_UNIT_HERO_SKILL' }) then
                        trigger.learning_unit = u
                        trigger.learned_skill = tab.skill
                        trigger.learned_skill_level = u:get_ability_level(tab.skill)
                    end
                    if pue.name == 'EVENT_PLAYER_HERO_REVIVABLE' then
                        trigger.revivable_unit = u
                    end
                    if common_util.is_in_table(pue.name,
                            { 'EVENT_PLAYER_HERO_REVIVE_START', 'EVENT_PLAYER_HERO_REVIVE_CANCEL',
                              'EVENT_PLAYER_HERO_REVIVE_FINISH', 'EVENT_UNIT_HERO_REVIVE_START',
                              'EVENT_UNIT_HERO_REVIVE_CANCEL', 'EVENT_UNIT_HERO_REVIVE_FINISH', }) then
                        trigger.reviving_unit = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_ATTACKED' then
                        trigger.attacker = tab.attacker
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_RESCUED' then
                        trigger.attacker = tab.rescuer
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_DEATH' then
                        trigger.dying_unit = u
                        trigger.killer = tab.killer
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_DECAY' then
                        trigger.decaying_unit = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_SELECTED' then
                        trigger.selected_unit = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_CONSTRUCT_START' then
                        trigger.constructing_structure = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_CONSTRUCT_FINISH' then
                        trigger.constructed_structure = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL' then
                        trigger.cancelled_structure = u
                    end
                    if common_util.is_in_table(pue.name, { 'EVENT_PLAYER_UNIT_RESEARCH_START', 'EVENT_PLAYER_UNIT_RESEARCH_CANCEL' }) then
                        trigger.researching_unit = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_RESEARCH_FINISH' then
                        trigger.researching_unit = u
                        trigger.researched = tab.researched
                    end
                    if common_util.is_in_table(pue.name, { 'EVENT_PLAYER_UNIT_TRAIN_START', 'EVENT_PLAYER_UNIT_TRAIN_CANCEL' }) then
                        trigger.trained_unit_type = tab.trained_unit_type
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_TRAIN_FINISH' then
                        trigger.trained_unit = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_DETECTED' then
                        trigger.detected_unit = u
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_SUMMONED' then
                        trigger.summoned_unit = u
                        trigger.summoning_unit = tab.summoning_unit
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_LOADED' then
                        trigger.loaded_unit = u
                        trigger.transport_unit = tab.transport_unit
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_SELL' then
                        trigger.selling_unit = u
                        trigger.sold_unit = tab.sold_unit
                        trigger.buying_unit = tab.buying_unit
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_SELL_ITEM' then
                        trigger.sold_item = tab.sold_item
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_CHANGE_OWNER' then
                        trigger.changing_unit = u
                        trigger.changing_unit_prev_owner = p
                    end
                    if common_util.is_in_table(pue.name, { 'EVENT_PLAYER_UNIT_DROP_ITEM', 'EVENT_PLAYER_UNIT_PICKUP_ITEM', 'EVENT_PLAYER_UNIT_USE_ITEM' }) then
                        trigger.manipulating_unit = tab.u
                        trigger.manipulated_item = tab.manipulated_item
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_ISSUED_ORDER' then
                        trigger.ordered_unit = u
                        trigger.issued_order_id = tab.issued_order_id
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER' then
                        trigger.order_point_x = tab.order_point_loc:get_x()
                        trigger.order_point_y = tab.order_point_loc:get_y()
                        trigger.order_point_loc = tab.order_point_loc
                    end
                    if pue.name == 'EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER' then
                        trigger.order_target = tab.order_target
                        if tab.order_target.type == 'unit' then
                            trigger.order_target_unit = tab.order_target
                        end
                        if tab.order_target.type == 'item' then
                            trigger.order_target_item = tab.order_target
                        end
                        if tab.order_target.type == 'destructable' then
                            trigger.order_target_destructable = tab.order_target
                        end
                    end
                    if common_util.is_in_table(pue.name, {
                        'EVENT_UNIT_SPELL_CHANNEL', 'EVENT_UNIT_SPELL_CAST', 'EVENT_UNIT_SPELL_EFFECT',
                        'EVENT_UNIT_SPELL_FINISH', 'EVENT_UNIT_SPELL_ENDCAST', 'EVENT_PLAYER_UNIT_SPELL_CHANNEL',
                        'EVENT_PLAYER_UNIT_SPELL_CAST', 'EVENT_PLAYER_UNIT_SPELL_EFFECT', 'EVENT_PLAYER_UNIT_SPELL_FINISH',
                        'EVENT_PLAYER_UNIT_SPELL_ENDCAST', }) then
                        trigger.spell_ability_unit = u
                        trigger.spell_ability_id = tab.spell_ability_id
                        trigger.spell_ability = tab.spell_ability
                        trigger.spell_target_loc = tab.spell_target_loc
                        trigger.spell_target_x = tab.spell_target_loc:get_x()
                        trigger.spell_target_y = tab.spell_target_loc:get_y()
                        if tab.spell_target.type == 'unit' then
                            trigger.spell_target_unit = tab.spell_target
                        end
                        if tab.spell_target.type == 'item' then
                            trigger.spell_target_item = tab.spell_target
                        end
                        if tab.spell_target.type == 'destructable' then
                            trigger.spell_target_destructable = tab.spell_target
                        end
                    end
                    if trigger_util.evaluate(t.conditions) then
                        trigger_util.execute(t.actions)
                    end
                end
            end
        end
    end
end

-- @param tab 其他参数的table
function trigger_util.trig_unit_event(u, ue, tab)

    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == ue then
                group.filter_unit = u
                if not e.filter or e.filter() then
                    trigger.triggering = t
                    trigger.unit = u
                    if ue.name == 'EVENT_UNIT_DAMAGED' then
                        trigger.event_damage = tab.event_damage
                        trigger.event_damage_source = tab.event_damage_source
                    end
                    if ue.name == 'EVENT_UNIT_DEATH' then
                        trigger.dying_unit = u
                    end
                    if ue.name == 'EVENT_UNIT_DECAY' then
                        trigger.decaying_unit = u
                    end
                    if ue.name == 'EVENT_UNIT_DETECTED' then
                        trigger.detecting_player = tab.detecting_player
                    end
                    if common_util.is_in_table(ue.name, { 'EVENT_UNIT_ACQUIRED_TARGET', 'EVENT_UNIT_TARGET_IN_RANGE' }) then
                        trigger.target_unit = tab.target_unit
                    end
                    if ue.name == 'EVENT_UNIT_ATTACKED' then
                        trigger.attacker = tab.attacker
                    end
                    if ue.name == 'EVENT_UNIT_RESCUEDED' then
                        trigger.rescuer = tab.rescuer
                    end
                    if ue.name == 'EVENT_UNIT_CONSTRUCT_FINISH' then
                        trigger.constructed_structure = u
                    end
                    if ue.name == 'EVENT_UNIT_CONSTRUCT_CANCEL' then
                        trigger.cancelled_structure = u
                    end
                    if common_util.is_in_table(ue.name, { 'EVENT_UNIT_TRAIN_START', 'EVENT_UNIT_TRAIN_CANCEL' }) then
                        trigger.trained_unit_type = tab.trained_unit_type
                    end
                    if ue.name == 'EVENT_UNIT_TRAIN_FINISH' then
                        trigger.trained_unit = u
                    end
                    if ue.name == 'EVENT_UNIT_SELL_ITEM' then
                        trigger.sold_item = tab.sold_item
                    end
                    if common_util.is_in_table(ue.name, { 'EVENT_UNIT_DROP_ITEM', 'EVENT_UNIT_PICKUP_ITEM', 'EVENT_UNIT_USE_ITEM' }) then
                        trigger.manipulating_unit = tab.u
                        trigger.manipulated_item = tab.manipulated_item
                    end
                    if ue.name == 'EVENT_UNIT_ISSUED_ORDER' then
                        trigger.ordered_unit = u
                        trigger.issued_order_id = tab.issued_order_id
                    end
                    if ue.name == 'EVENT_UNIT_ISSUED_POINT_ORDER' then
                        trigger.order_point_x = tab.order_point_loc:get_x()
                        trigger.order_point_y = tab.order_point_loc:get_y()
                        trigger.order_point_loc = tab.order_point_loc
                    end
                    if ue.name == 'EVENT_UNIT_ISSUED_TARGET_ORDER' then
                        trigger.order_target = tab.order_target
                        if tab.order_target.type == 'unit' then
                            trigger.order_target_unit = tab.order_target
                        end
                        if tab.order_target.type == 'item' then
                            trigger.order_target_item = tab.order_target
                        end
                        if tab.order_target.type == 'destructable' then
                            trigger.order_target_destructable = tab.order_target
                        end
                    end
                    if trigger_util.evaluate(t.conditions) then
                        trigger_util.execute(t.actions)
                    end
                end
            end
        end
    end
end

function trigger_util.trig_timer_expire_event(tm)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == gameevent[4] and e.timer == tm then
                trigger.triggering = t
                trigger.expired_timer = tm
                if trigger_util.evaluate(t.conditions) then
                    trigger_util.execute(t.actions)
                end
            end
        end
    end
end

function trigger_util.trig_game_state_event(time_of_day)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == gameevent[3] then
                trigger.triggering = t
                local flag = false
                if e.state == fgamestate[2] then
                    if e.opcode.name == 'LESS_THAN' and time_of_day < e.value then
                        flag = true
                    end
                    if e.opcode.name == 'LESS_THAN_OR_EQUAL' and time_of_day <= e.value then
                        flag = true
                    end
                    if e.opcode.name == 'EQUAL' and time_of_day == e.value then
                        flag = true
                    end
                    if e.opcode.name == 'GREATER_THAN_OR_EQUAL' and time_of_day >= e.value then
                        flag = true
                    end
                    if e.opcode.name == 'GREATER_THAN' and time_of_day > e.value then
                        flag = true
                    end
                    if e.opcode.name == 'NOT_EQUAL' and time_of_day ~= e.value then
                        flag = true
                    end
                end
                if flag then
                    if trigger_util.evaluate(t.conditions) then
                        trigger_util.execute(t.actions)
                    end
                end
            end
        end
    end
end

function trigger_util.trig_enter_region(u, r)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == gameevent[5] then
                trigger.triggering = t
                trigger.triggering_region = r
                trigger.unit = u
                if r == e.region and e.filter.fun() then
                    if trigger_util.evaluate(t.conditions) then
                        trigger_util.execute(t.actions)
                    end
                end
            end
        end
    end
end

function trigger_util.trig_leave_region(u, r)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == gameevent[6] then
                trigger.triggering = t
                trigger.triggering_region = r
                trigger.unit = u
                if r == e.region and e.filter.fun() then
                    if trigger_util.evaluate(t.conditions) then
                        trigger_util.execute(t.actions)
                    end
                end
            end
        end
    end
end

-- param p:触发单位 db:触发按钮
function trigger_util.trig_dialog_event(p, db)
    for _, t in pairs(trigger.all_triggers) do
        for _, e in pairs(t.registered_events) do
            if e.event_id == dialogevent[91] then
                trigger.triggering = t
                trigger.player = p
                trigger.clicked_button = db
                if trigger_util.evaluate(t.conditions) then
                    trigger_util.execute(t.actions)
                end
            end
        end
    end
end

return trigger_util

