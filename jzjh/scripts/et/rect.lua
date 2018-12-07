---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/1 10:17
---

local rect = {}
et.rect = rect

setmetatable(rect, rect)

--- @class rect
local mt = {}
rect.__index = mt

mt.type = 'rect'
mt.min_x = 0
mt.max_x = 0
mt.min_y = 0
mt.max_y = 0

function mt:get_min_x()
    return self.min_x
end

function mt:get_min_y()
    return self.min_y
end

function mt:get_max_x()
    return self.max_x
end

function mt:get_max_y()
    return self.max_y
end

--- 事件通知
function mt:event_notify(name, ...)
    et.event_notify(self, name, ...)
    et.event_notify(et.game, name, ...)
end

--- @param u unit
function mt:contains_unit(u)
    local x, y = u:get_point():get()
    return self.min_x <= x and x <= self.max_x and self.min_y <= y and y <= self.max_y
end

--- @param j_rect j_rect
--- @return rect
function rect:__call(j_rect)
    return rect.j_rect(j_rect)
end

--- @param j_rect j_rect
--- @return rect
function rect.j_rect(j_rect)
    if not rect[j_rect] then
        rect[j_rect] = setmetatable({}, rect)
        rect[j_rect].min_x = jass.GetRectMinX(j_rect)
        rect[j_rect].min_y = jass.GetRectMinY(j_rect)
        rect[j_rect].max_x = jass.GetRectMaxX(j_rect)
        rect[j_rect].max_y = jass.GetRectMaxY(j_rect)
        rect[j_rect].handle = j_rect
        local j_trg = war3.CreateTrigger(function()
            local u = jass.GetEnteringUnit()
            local r = rect[j_rect]
            rect[j_rect]:event_notify('单位-进入区域', u, r)
        end)
        local j_region = jass.CreateRegion()
        jass.RegionAddRect(j_region, j_rect)
        jass.TriggerRegisterEnterRegion(j_trg, j_region, nil)
    end
    return rect[j_rect]
end

--- @param min_x number
--- @param min_y number
--- @param max_x number
--- @param max_y number
--- @return rect
function rect.new(min_x, min_y, max_x, max_y)
    local j_rect = jass.Rect(min_x, min_y, max_x, max_y)
    return rect.j_rect(j_rect)
end

--- @return point
function mt:get_center()
    return et.point((min_x + max_x) / 2, (min_y + max_y) / 2)
end

--- @return point
function mt:get_random()
    x = math.random(min_x, max_x)
    y = math.random(min_y, max_y)
    return et.point(x, y)
end


function rect.init()
    udg_jail = rect.new(9703.0, -15845.0, 11395.0, -13510.0)
    udg_yizhan = rect.new(-224, -1504, 32, -1248)
    udg_xuanmenpai = rect.new(952, -4548, 2330, -2956)
    udg_tiaozhanqu = rect.new(10000, -13320, 13530, -10600)
    rect_born = rect.new(1504.0, -4288.0, 1856.0, -3968.0) -- 选择英雄后的出生点
    rect_reborn = rect.new(1664.0, -2944.0, 1920.0, -2688.0) -- 英雄复活位置（新手村）
    Ie = rect.new(4192.0, -4032.0, 5312.0, -3264.0) -- 少林寺练功房
    le = rect.new(3200.0, -4992.0, 4256.0, -4384.0) -- 少林寺练功房
    Re = rect.new(5344.0, -5056.0, 6496.0, -4448.0) -- 少林寺练功房
    Je = rect.new(-1472.0, -1536.0, 64.0, -864.0) -- 后方进攻终点
    Ke = rect.new(-1568.0, -672.0, 0.0, -64.0) -- 正面进攻终点
    Le = rect.new(-3296.0, 3488.0, -2784.0, 3936.0) -- 正面进攻点
    Me = rect.new(-1056.0, 5024.0, -448.0, 5600.0) -- 正面进攻点
    Ne = rect.new(1216.0, 3424.0, 1760.0, 3936.0) -- 正面进攻点
    Oe = rect.new(-960.0, -5248.0, -480.0, -4896.0) -- 后方进攻点
    botong = rect.new(12300, 1550, 12800, 2050) -- 周伯通
    Pe = rect.new(-2240.0, -544.0, -1952.0, -128.0) -- 郭靖
    Qe = rect.new(1024.0, -2944.0, 1344.0, -2752.0) -- 野狼
    Se = rect.new(1728.0, -5280.0, 1984.0, -5088.0) -- 野猪首领
    Te = rect.new(-5600.0, -3104.0, -5312.0, -2816.0) -- 丘处机
    Ue = rect.new(-3840.0, -2816.0, -3328.0, -2592.0) -- 全真教山下
    Ve = rect.new(2688.0, -6240.0, 3008.0, -5952.0) -- 慕容复
    We = rect.new(1280.0, -6464.0, 1632.0, -6208.0) -- 燕子坞ping点
    Xe = rect.new(3168.0, -864.0, 3488.0, -576.0) -- 鲁有脚
    Ye = rect.new(-5056.0, 192.0, -4736.0, 512.0) -- 林远图
    Ze = rect.new(-11968.0, 448.0, -11680.0, 736.0) -- FB1入口
    rect_instance_border = rect.new(-10688.0, -1152.0, -4864.0, 5792.0) -- 边境
    rect_peach_blossom_island = rect.new(8800, -4500, 14300, 4500) -- 桃花岛
    ef = rect.new(-13568.0, 2272.0, -13440.0, 2400.0) -- FB1神秘怪物
    ff = rect.new(1376.0, -3840.0, 1472.0, -3744.0) -- 临时地点
    gf = rect.new(-12448.0, 1440.0, -12288.0, 1600.0) -- FB1奇缘NPC随机地点
    hf = rect.new(-11584.0, 2496.0, -11456.0, 2624.0) -- FB1奇缘NPC随机地点
    jf = rect.new(-12704.0, 3680.0, -12576.0, 3808.0) -- FB1奇缘NPC随机地点
    sel = rect.new(-14688.0, 3552.0, -14560.0, 3680.0) -- FB1奇缘NPC随机地点
    mf = rect.new(-14752.0, 1760.0, -14624.0, 1888.0) -- FB1奇缘NPC随机地点
    nf = rect.new(-14080.0, 288.0, -13952.0, 416.0) -- FB1奇缘NPC随机地点
    rect_instance_one = rect.new(-15328.0, 96.0, -11296.0, 4352.0) -- FB1
    tf = rect.new(-3520.0, -4576.0, -3296.0, -4384.0) -- 江南七怪ping点
    rect_instance_two = rect.new(-15712.0, 5568.0, -11008.0, 10176.0) -- FB2
    yf = rect.new(-15392.0, 5184.0, -15136.0, 5440.0) -- FB2入口
    zf = rect.new(-12768.0, 6496.0, -12576.0, 6688.0) -- FB2神秘怪物
    Af = rect.new(-14240.0, 6176.0, -14080.0, 6304.0) -- FB2奇缘NPC随机地点
    af = rect.new(-14144.0, 7136.0, -13984.0, 7296.0) -- FB2奇缘NPC随机地点
    Bf = rect.new(-13888.0, 8352.0, -13728.0, 8480.0) -- FB2奇缘NPC随机地点
    bf = rect.new(-11488.0, 7936.0, -11328.0, 8096.0) -- FB2奇缘NPC随机地点
    Cf = rect.new(-11456.0, 5856.0, -11296.0, 6048.0) -- FB2奇缘NPC随机地点
    cf = rect.new(-13088.0, 5856.0, -12928.0, 5984.0) -- FB2奇缘NPC随机地点
    Df = rect.new(-10272.0, -5824.0, -6752.0, -1600.0)
    Ef = rect.new(-6080.0, -7136.0, -1728.0, -4224.0)
    rect_tomb_enter = rect.new(-6400.0, -1600.0, -6272.0, -1472.0) -- 古墓入口
    rect_tomb_start = rect.new(-9760.0, -5440.0, -9632.0, -5312.0) -- 古墓进入点
    rect_tomb_from_1 = rect.new(-10048.0, -5440.0, -9920.0, -5312.0) -- 古墓传送点
    rect_tomb_to_1 = rect.new(-6208.0, -1568.0, -6080.0, -1440.0) -- 古墓传送点
    rect_tomb_from_2 = rect.new(-8704.0, -3840.0, -8576.0, -3712.0) -- 古墓传送点
    rect_tomb_to_3 = rect.new(-8704.0, -3648.0, -8576.0, -3520.0) -- 古墓传送点
    rect_tomb_from_3 = rect.new(-9280.0, -3840.0, -9152.0, -3712.0) -- 古墓传送点
    rect_tomb_to_2 = rect.new(-9568.0, -3840.0, -9440.0, -3712.0) -- 古墓传送点
    Mf = rect.new(6048.0, -672.0, 7040.0, 384.0) -- 十八罗汉
    rect_instance_three = rect.new(-15680.0, 10432.0, -10976.0, 15296.0)  -- FB3
    rect_tomb_from_4 = rect.new(-13440.0, 11648.0, -13312.0, 11776.0)  -- 古墓传送点
    rect_tomb_to_5 = rect.new(-13728.0, 11840.0, -13600.0, 11968.0)  -- 古墓传送点
    rect_tomb_from_5 = rect.new(-12800.0, 11136.0, -12672.0, 11264.0)  -- 古墓传送点
    Rf = rect.new(1664.0, 6336.0, 6048.0, 10624.0) -- 华山论剑区域
    rect_tomb_to_4 = rect.new(-12480.0, 11168.0, -12352.0, 11296.0) -- 古墓传送点
    rect_tomb_from_6 = rect.new(-12416.0, 13184.0, -12288.0, 13312.0) -- 古墓传送点
    rect_tomb_to_7 = rect.new(-12160.0, 12992.0, -12032.0, 13120.0) -- 古墓传送点
    rect_tomb_from_7 = rect.new(-13056.0, 13376.0, -12928.0, 13504.0) -- 古墓传送点
    rect_tomb_to_6 = rect.new(-13248.0, 13664.0, -13120.0, 13792.0) -- 古墓传送点
    Xf = rect.new(-15264.0, 10912.0, -15136.0, 11040.0) -- FB3入口
    Yf = rect.new(-13312.0, 14688.0, -13184.0, 14816.0) -- FB3神秘怪物
    Zf = rect.new(-15072.0, 14752.0, -14944.0, 14880.0) -- FB3奇缘NPC随机地点
    rect_maze_to_1 = rect.new(-9088.0, 13504.0, -8896.0, 13664.0) -- 高昌迷宫传送点
    rect_maze_from_1 = rect.new(-6688.0, 15008.0, -6496.0, 15168.0) -- 高昌迷宫传送点
    rect_maze_to_2 = rect.new(-7968.0, 13408.0, -7776.0, 13568.0) -- 高昌迷宫传送点
    rect_maze_from_2 = rect.new(-8864.0, 12992.0, -8672.0, 13152.0) -- 高昌迷宫传送点
    rect_maze_to_3 = rect.new(-8768.0, 11360.0, -8576.0, 11552.0) -- 高昌迷宫传送点
    rect_maze_from_3 = rect.new(-9504.0, 12832.0, -9312.0, 13024.0) -- 高昌迷宫传送点
    rect_maze_from_4 = rect.new(-6784.0, 11328.0, -6592.0, 11520.0) -- 高昌迷宫传送点
    rect_maze_to_4 = rect.new(-6880.0, 9184.0, -6688.0, 9376.0) -- 高昌迷宫传送点
    rect_maze_to_5 = rect.new(-9568.0, 11360.0, -9376.0, 11552.0) -- 高昌迷宫传送点
    rect_maze_from_5 = rect.new(-9632.0, 10880.0, -9440.0, 11072.0) -- 高昌迷宫传送点
    rect_maze_to_6 = rect.new(-9056.0, 9344.0, -8864.0, 9536.0) -- 高昌迷宫传送点
    rect_maze_from_6 = rect.new(-8992.0, 8832.0, -8800.0, 9024.0) -- 高昌迷宫传送点
    rect_maze_from_7 = rect.new(-7456.0, 10144.0, -7264.0, 10336.0) -- 高昌迷宫传送点
    rect_maze_to_7 = rect.new(-7136.0, 12736.0, -6944.0, 12928.0) -- 高昌迷宫传送点
    rect_maze_from_8 = rect.new(-6656.0, 14176.0, -6464.0, 14368.0) -- 高昌迷宫传送点
    rect_maze_to_8 = rect.new(-6848.0, 6688.0, -6656.0, 6880.0) -- 高昌迷宫传送点
    rect_maze_from_9 = rect.new(-6912.0, 8576.0, -6720.0, 8768.0) -- 高昌迷宫传送点
    rect_maze_to_9 = rect.new(-9728.0, 7584.0, -9536.0, 7744.0) -- 高昌迷宫传送点
    rect_maze_from_10 = rect.new(-9632.0, 9184.0, -9408.0, 9376.0) -- 高昌迷宫传送点
    rect_maze_from_11 = rect.new(-9088.0, 7008.0, -8928.0, 7200.0) -- 高昌迷宫进入点
    rect_maze_from_12 = rect.new(-8192.0, 7776.0, -8032.0, 7936.0) -- 高昌迷宫传送点
    rect_maze_start = rect.new(-9856.0, 6624.0, -9664.0, 6816.0) -- 高昌迷宫进入点
    Ag = rect.new(-5216.0, 6848.0, -5088.0, 6976.0) -- 十恶不赦进入点
    ag = rect.new(5568.0, -1056.0, 5792.0, -768.0) -- 少林寺后山(十八罗汉)
    Bg = rect.new(-3616.0, -96.0, -3328.0, 224.0) -- 十恶不赦完成任务
    bg = rect.new(-5856.0, 6784.0, -2848.0, 11328.0) -- 十恶不赦区域
    rect_depository_start = rect.new(4576.0, -2304.0, 4736.0, -2112.0) -- 藏经阁进入点
    cg = rect.new(4160.0, -3168.0, 7200.0, -1216.0) -- 藏经阁
    Dg = rect.new(-14912.0, -4928.0, -14720.0, -4768.0) -- FB4入口
    Eg = rect.new(-15264.0, -6560.0, -15072.0, -6368.0) -- FB4神秘怪物
    Fg = rect.new(-13120.0, -2112.0, -12960.0, -1952.0) -- FB4奇缘NPC随机地点
    rect_instance_four = rect.new(-15744.0, -6752.0, -10656.0, -320.0) -- FB4
    rect_valley_bottom_start = rect.new(-15520.0, -10208.0, -15296.0, -9952.0) -- 绝情谷底进入点
    lg = rect.new(-12384.0, -6080.0, -12000.0, -5600.0) -- 完成断肠草任务
    Jg = rect.new(-32.0, 11968.0, 256.0, 12224.0) -- 勇闯光明顶进入点
    Kg = rect.new(-5760.0, 11520.0, 512.0, 15296.0) -- 勇闯光明顶区域
    Lg = rect.new(-1280.0, 10944.0, -1056.0, 11200.0) -- 勇闯光明顶完成任务
    rect_instance_five = rect.new(1792.0, 11456.0, 5504.0, 15648.0) -- FB5
    Ng = rect.new(2112.0, 11840.0, 2304.0, 12032.0) -- FB5入口
    Og = rect.new(4800.0, 14016.0, 4992.0, 14208.0) -- FB5神秘怪物
    Pg = rect.new(3904.0, 12800.0, 4032.0, 12928.0) -- FB5奇缘NPC随机地点
    Qg = rect.new(3616.0, 8448.0, 3840.0, 8672.0) -- 华山论剑进入点
    Rg = rect.new(4320.0, 320.0, 4512.0, 512.0) -- 华山论剑完成任务
    Sg = rect.new(864.0, -5248.0, 1024.0, -5088.0) -- 剑意入口
    rect_former_dynasty_start = rect.new(-14816.0, -15616.0, -14592.0, -15488.0) -- 前朝入口
    Wg = rect.new(7200.0, 11904.0, 7392.0, 12064.0) -- FB6入口
    Xg = rect.new(7200.0, 14592.0, 7328.0, 14720.0) -- FB6神秘怪物
    rect_instance_six = rect.new(6432.0, 11648.0, 8256.0, 15264.0) -- FB6
    Zg = rect.new(-10080.0, 608.0, -9888.0, 800.0) -- 紫禁决战完成任务
    dh = rect.new(9312.0, 13696.0, 9504.0, 13888.0) -- 紫禁决战入口
    eh = rect.new(8960.0, 13440.0, 10976.0, 15744.0) -- 紫禁决战区域
    fh = rect.new(-10688.0, 4704.0, -10560.0, 4864.0) -- 聚贤山庄入口
    gh = rect.new(-10112.0, 5216.0, -9984.0, 5376.0) -- 耶律楚材到达点
    hh = rect.new(-9824.0, -320.0, -9664.0, -160.0) -- 耶律楚材出生点
    udg_liuqiu = rect.new(5728.0, -13472.0, 5952.0, -13248.0) -- 琉球岛
    jh = rect.new(3104.0, -13344.0, 3328.0, -13120.0) -- 大清藏宝洞入口
    kh = rect.new(-9248.0, -96.0, -8832.0, 320.0) -- 完成高昌迷宫任务
    mh = rect.new(-6528.0, 4224.0, -6336.0, 4384.0) -- 辽国第一先锋
    nh = rect.new(416.0, -864.0, 576.0, -704.0) -- 整理物品 D古董
    oh = rect.new(416.0, -1152.0, 576.0, -992.0) -- 整理物品 C古董
    ph = rect.new(416.0, -1472.0, 576.0, -1312.0) -- 整理物品 B古董
    qh = rect.new(416.0, -1760.0, 576.0, -1600.0) -- 整理物品 A古董
    rh = rect.new(-2784.0, -832.0, -2624.0, -672.0) -- 整理物品 C草药
    sh = rect.new(-2336.0, -832.0, -2176.0, -672.0) -- 整理物品 B草药
    th = rect.new(-2272.0, -1280.0, -2112.0, -1120.0) -- 整理物品 A草药
    uh = rect.new(-9216.0, -14464.0, -8800.0, -14048.0) -- 名人榜
    rect_best_residence_start = rect.new(-7584.0, -11648.0, -7392.0, -11456.0) -- 一品居
end

rect.init()

return rect
