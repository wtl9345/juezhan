---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/12/5 9:41
---

--- FB5 逍遥宫

--- {李秋水}：{抗魔护符、云灭护符}
drop_item(1852270642, { [1227894870] = 50, [1227894869] = 50 })

--- {天山童姥}：{重生链}
drop_item(1852207984, { [1227894871] = 100 })

--- {无崖子}：{晶玉扇、软猬甲}、{珍珑棋局}
drop_item(1852663652, { [1227894864] = 50, [1227894863] = 50 }, { [1227899713] = 3 })

--- {闪电蜥蜴}：{闪电貂}
drop_item(1853058166, { [1227895861] = 100 })

--- {千山雪母}：{雪彩蛛}
drop_item(1853055597, { [1227895860] = 100 })

--- 有玩家进入副本5
enter_instance_listener {
    num = 5,
    item_id = 1227895894,
    name = '逍遥宫',
    gold = 6000,
    practice = 4,
    practice_point = et.point(-1168.0, 11072.0),
    enter_point = et.point(2208.0, 11936.0),
    mystery_point = et.point(4896.0, 14112.0),
    mystery_set = set:new { 1853058166, 1853055597, },
    rare_drop_set = set:new { 1227894865, 1227894867, 1227894866, },
    npc_set = set:new {1865429080 },
    npc_point_set = set:new {
        et.point(3968.0	,	12864.0),
    },
}

