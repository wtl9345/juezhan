---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018/10/30 17:10
---

-------激活残章-----
local residual = {}
residual[1227896371] = {
    kongfu = 1093678920,
    point = 5,
    requires = { 1093678935, 1093678933, 1093679152 },
    name = "反两仪刀法第1式：行气如虹",
}
residual[1227896370] = {
    kongfu = 1093679157,
    point = 5,
    requires = { 1093678928, 1093678930, 1093679154 },
    name = "六脉神剑第1式：少商剑",
}
residual[1227896369] = {
    kongfu = 1093678924,
    point = 5,
    requires = { 1093679154, 1093678929, 1093682254 },
    name = "打狗棒法第1式：恶狗拦路",
}
residual[1227896374] = {
    kongfu = 1093678918,
    point = 5,
    requires = { 1093679428, 1093679152, 1093678897 },
    name = "独孤九剑第1式：破剑式",
}
residual[1227896372] = {
    kongfu = 1093679158,
    point = 5,
    requires = { 1093679155, 1093678936, 1093678669 },
    name = "胡家刀法第1式：八方藏刀式",
}
residual[1227896368] = {
    kongfu = 1093679161,
    point = 5,
    requires = { 1093679156, 1093682226, 1093678931 },
    name = "西毒棍法第1式：蛇盘青竹",
}
residual[1227896377] = {
    kongfu = 1093678922,
    point = 5,
    requires = { 1093678666, 1093678932, 1395666994 },
    name = "辟邪剑法第1式：流星赶月",
}
residual[1227896376] = {
    kongfu = 1093678921,
    point = 5,
    requires = { 11093678926, 1093682232, 1093678936 },
    name = "野球拳第1式：翻肘裂捶",
}
residual[1227896375] = {
    kongfu = 1093678917,
    point = 5,
    requires = { 1093682232, 1093678927, 1093682254 },
    name = "降龙十八掌第1式：神龙摆尾",
}
residual[1227896373] = {
    kongfu = 1093678919,
    point = 5,
    requires = { 1093678664, 1093678931, 1093679156 },
    name = "黯然销魂掌第1式：无中生有",
}
residual[1227899735] = {
    kongfu = 1093682254,
    point = 5,
    requires = { 1093682254, 1093679428, 1093678936 },
    name = "九阳真经残卷",
}



local wuhun = jass.DialogCreate()
local function add_buttons(u)

end
--武魂石系统
function WuHunShi()
    local u = GetTriggerUnit()
    local p = GetOwningPlayer(u)
    local i = 1 + GetPlayerId(p)
    DialogClear(wuhun)
    RemoveItem(GetManipulatedItem())
    DialogSetMessage(wuhun, "请选择要激活的残章")
    if Jd[i] == 0 then
        wuhun1[1] = DialogAddButtonBJ(wuhun, "反两仪刀法")
    end
    if Id[i] == 0 then
        wuhun1[2] = DialogAddButtonBJ(wuhun, "六脉神剑")
    end
    if Qd[i] == 0 then
        wuhun1[3] = DialogAddButtonBJ(wuhun, "打狗棒法")
    end
    if ld[i] == 0 then
        wuhun1[4] = DialogAddButtonBJ(wuhun, "独孤九剑")
    end
    if Od[i] == 0 then
        wuhun1[5] = DialogAddButtonBJ(wuhun, "胡家刀法")
    end
    if Pd[i] == 0 then
        wuhun1[6] = DialogAddButtonBJ(wuhun, "西毒棍法")
    end
    if Kd[i] == 0 then
        wuhun1[7] = DialogAddButtonBJ(wuhun, "辟邪剑法")
    end
    if Ld[i] == 0 then
        wuhun1[8] = DialogAddButtonBJ(wuhun, "野球拳法")
    end
    if Nd[i] == 0 then
        wuhun1[9] = DialogAddButtonBJ(wuhun, "降龙十八掌")
    end
    if Md[i] == 0 then
        wuhun1[10] = DialogAddButtonBJ(wuhun, "黯然销魂掌")
    end
    wuhun1[11] = DialogAddButtonBJ(wuhun, "取消")
    DialogDisplay(p, wuhun, true)
    u = nil
    p = nil
end
function JiHuoCanZhang()
    local p = GetTriggerPlayer()
    local i = 1 + GetPlayerId(p)
    if GetClickedButton() == wuhun1[1] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了反两仪刀法第1式：行气如虹")
        Jd[i] = 1
    end
    if GetClickedButton() == wuhun1[2] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了六脉神剑第1式：少商剑")
        Id[i] = 1
    end
    if GetClickedButton() == wuhun1[3] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了打狗棒法第1式：恶狗拦路")
        Qd[i] = 1
    end
    if GetClickedButton() == wuhun1[4] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了独孤九剑第1式：破剑式")
        ld[i] = 1
    end
    if GetClickedButton() == wuhun1[5] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了胡家刀法第1式：八方藏刀式")
        Od[i] = 1
    end
    if GetClickedButton() == wuhun1[6] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了西毒棍法第1式：蛇盘青竹")
        Pd[i] = 1
    end
    if GetClickedButton() == wuhun1[7] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了辟邪剑法第1式：流星赶月")
        Kd[i] = 1
    end
    if GetClickedButton() == wuhun1[8] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了野球拳第1式：翻肘裂捶")
        Ld[i] = 1
    end
    if GetClickedButton() == wuhun1[9] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了降龙十八掌第1式：神龙摆尾")
        Nd[i] = 1
    end
    if GetClickedButton() == wuhun1[10] then
        DisplayTextToPlayer(p, 0, 0, "|CFF00ff33恭喜激活了黯然销魂掌第1式：无中生有")
        Md[i] = 1
    end
    if GetClickedButton() == wuhun1[11] then
        UnitAddItemById(P4[i], 1227897169)
    end
    p = nil
end

local function init()
    et.game:event '单位-使用物品'(function(self, u, item)
        local r = residual[jass.GetItemTypeId(item)]
        local p = u:get_owner()
        local h = p.hero
        local i = p.id
        if r then
            if not u:has_ability(r.kongfu) then
                p:send_message("|CFFFF0033你尚未学会该武功，无法激活隐藏招式")
                u:add_item(jass.GetItemTypeId(item))
            else
                if is_in(r.kongfu, h.activated) then
                    p:send_message("|CFFFF0033你之前已经激活过了")
                    u:add_item(jass.GetItemTypeId(item))
                else
                    if h['绝学领悟'] >= r.point and u:has_all_abilities(r.requires) then
                        table.insert(h.activated, r.kongfu)
                        p:send_message("|CFF00ff33恭喜激活了" .. r.name)
                    else
                        p:send_message("|CFFFF0033条件不足，激活失败")
                        u:add_item(jass.GetItemTypeId(item))
                    end
                end

            end
        end
        if jass.GetItemTypeId(item) == 1227897169 then
            if (not De[i] and not Ee[i]) then
                p:send_message("|CFFFF0033未集齐决战套装或江湖套装，激活失败")
            else

            end

        end

    end)

    ak = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(ak, EVENT_PLAYER_UNIT_USE_ITEM)
    TriggerAddCondition(ak, Condition(IsWuHunShi))
    TriggerAddAction(ak, WuHunShi)
    t = CreateTrigger()
    TriggerRegisterDialogEvent(t, wuhun)
    TriggerAddAction(t, JiHuoCanZhang)
end
init()
