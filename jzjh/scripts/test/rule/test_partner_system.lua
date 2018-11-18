---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/17 0017 12:08
---

require 'test.test-main'
local trigger_util = require 'jass.util.trigger_util'
local test_util = require 'test.util.test_util'

local function test_partner_system()
    --for k, v in pairs(et.lni.partner) do
    --    print(k, v)
    --    for k1, v1 in pairs(v) do
    --        print('\t', k1, v1)
    --    end
    --end
    local h = test_util.player1_select_hero()
    local tab = {
        manipulated_item = test_util.create_item(1227899731)
    }
    trigger_util.trig_player_event(et.player(1).handle, jass.EVENT_PLAYER_END_CINEMATIC)
    trigger_util.trig_player_unit_event(h:get_owner().handle, jass.EVENT_PLAYER_UNIT_USE_ITEM, h.handle, tab)
    trigger_util.trig_player_event(et.player(1).handle, jass.EVENT_PLAYER_END_CINEMATIC)
    trigger_util.trig_player_unit_event(h:get_owner().handle, jass.EVENT_PLAYER_UNIT_USE_ITEM, h.handle, tab)
    trigger_util.trig_player_event(et.player(1).handle, jass.EVENT_PLAYER_END_CINEMATIC)

end
test_partner_system()