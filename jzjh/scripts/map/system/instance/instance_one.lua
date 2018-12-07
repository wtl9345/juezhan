---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/12/4 17:20
---


--- 副本1 马贼洞


--- {破戒僧、马贼}：{悟性丹、经脉丹}、{传家符}
drop_item({ 1869834349, 1851880307 }, { [1227895370] = 4, [1227895369] = 4 }, { [1227895127] = 1 })

--- {恶道头子}：{纱绒护腕、闪避护符}
drop_item(1868853091, { [1227895125] = 50, [1227895130] = 50 })

--- {马贼王中王}：{开山斧、水碧护符、琥珀项链}
drop_item(1869767017, { [1227895123] = 33, [1227895129] = 33, [1227895128] = 34 })

--- {火工头陀}：{九阳神功、罗汉伏魔功}
drop_item { 1869898101, { [1227895386] = 50, [1227895620] = 50 } }

--- {丁春秋}：{化功大法、化骨绵掌、吸星大法}
drop_item(1868852084, { [1227895381] = 33, [1227895623] = 33, [1227895383] = 34 })

--- {毒手药王}：{易筋洗髓丹、脱胎换骨丹、乾坤丹}
drop_item(1969316719, { [1227895372] = 33, [1227895374] = 33, [1227895371] = 34 })

--- 有玩家进入副本1
enter_instance_listener {
    num = 1,
    item_id = 1227895366,
    name = '马贼洞',
    gold = 100,
    practice = 0,
    practice_point = et.point(-5456.0, -2960.0),
    enter_point = et.point(-11824.0, 592.0),
    mystery_point = et.point(-13504.0, 2336.0),
    mystery_set = set:new { 1869898101, 1868852084, 1969316719 },
    rare_drop_set = set:new { 1227895345, 1227895116, 1227895117, 1227895110 },
    npc_set = set:new { 1865429068 },
    npc_point_set = set:new {
        et.point(-12368.0, 1520.0),
        et.point(-11520.0, 2560.0),
        et.point(-12640.0, 3744.0),
        et.point(-14624.0, 3616.0),
        et.point(-14688.0, 1824.0),
        et.point(-14016.0, 352.0),
    },
}

--- FB1奇缘NPC韦小宝
local wei_flag = true
--- @type player
local wei_player
--- @param source unit 被接近的单位
--- @param approach unit 接近的单位
et.game:event '单位-被接近'(function(self, source, approach)
    if source:get_type_id() == 1865429068 and approach:is_hero() then
        wei_player = approach:get_owner()
        wei_flag = true
        wei_player:send_message("|cFFFFCC33韦小宝想邀请你同他赌一局，你是否愿意呢？|cFF33FFFF15秒钟内操作键盘选择  \n↑：同意并将身上的钱全部下注\n←：同意并将身上50%的钱下注\n→：同意并将身上25%的钱下注\n↓：拒绝")
        et.wait(15 * 1000, function()
            wei_flag = false
        end)
        source:remove()
    end
end)

--- @param p player
--- @param possibility number
--- @param gold_percent number
local function gamble_result(p, possibility, gold_percent)
    if commonutil.random(0, 100) < possibility then
        p:add_gold(math.floor(p:get_gold() * gold_percent / 100))
        p:send_message('赌赢了~')
        force.send_message("|CFF66FF00有玩家和韦小宝赌博赢得了大量的金钱，停怪就靠他了")
    else
        p:add_gold(-math.floor(p:get_gold() * gold_percent / 100))
        p:send_message('赌输了！！')
        force.send_message("|CFF66FF00有玩家和韦小宝输得一踏糊涂，大家祈祷吧")
    end
end

--- @param p player
et.game:event '单位-按下左键'(function(self, p)
    if p == wei_player then
        gamble_result(p, 60, 50)
    end
    wei_player = nil
end)

--- @param p player
et.game:event '单位-按下右键'(function(self, p)
    if p == wei_player then
        gamble_result(p, 70, 25)
    end
    wei_player = nil
end)

--- @param p player
et.game:event '单位-按下上键'(function(self, p)
    if p == wei_player then
        gamble_result(p, 50, 100)
    end
    wei_player = nil
end)

--- @param p player
et.game:event '单位-按下下键'(function(self, p)
    if p == wei_player then
        force.send_message("|CFF66FF00有玩家放弃和韦小宝赌博")
    end
    wei_player = nil
end)

et.game:event '单位-死亡'(function(self, killer, killed)
    if et.rect.j_rect(rect_instance_one):contains_unit(killer) and commonutil.random(0, 100) <= 2 then
        if instance_info[1].rare_drop_id then
            local x, y = killed:get_point():get()
            et.item:new(instance_info[1].rare_drop_id, x, y)
        end
    end
end)
