---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/12/5 8:51
---

--- FB3 塞北

--- {南海鳄神}：{开阳衣、梦蝶项链、白虎符}
drop_item(1853059439, { [1227895095] = 33, [1227895107] = 33, [1227895097] = 34 })

--- {叶二娘}：{金蝉衣、彩云腕、北斗护符}
drop_item(1852338802, { [1227895877] = 33, [1227895096] = 33, [1227895106] = 34 })

--- {段延庆}：{断肠}
drop_item(1853186679, { [1227895878] = 100 })

--- {梅超风}：{弹指神通、九阴白骨爪、九阴真经·内功}
drop_item(1702061422, { [1227895624] = 33, [1227895625] = 33, [1227895384] = 34 })

--- {云中鹤}：{蓝魔项链、宣花斧}、{擒龙控鹤}
drop_item(1852796263, { [1227895105] = 50, [1227895094] = 50 }, { [1227899715] = 10 })

--- {张无忌}：{乾坤大挪移、葵花宝典}
drop_item(1701672039, { [1227895600] = 50, [1227895385] = 50 })

--- {武三通}：{一阳指、双手互搏}
drop_item(1970169187, { [1227895622] = 50, [1227895601] = 50 })

--- {熊}：{根骨丹、医术丹}
drop_item(1852207724, { [1227895363] = 6 }, { [1227895375] = 6 })

--- 有玩家进入副本3
enter_instance_listener {
    num = 3,
    item_id = 1227895875,
    name = '塞北',
    gold = 1000,
    practice = 2,
    practice_point = et.point(5680.0, -912.0),
    enter_point = et.point(-15200.0, 10976.0),
    mystery_point = et.point(-13248.0, 14752.0),
    mystery_set = set:new { 1701672039, 1702061422, 1970169187, },
    rare_drop_set = set:new { 1227895379, 1227895380, 1227895857, },
    npc_set = set:new { 1865429073 },
    npc_point_set = set:new {
        et.point(-15008.0, 14816.0),
    },
}


