---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/15 21:40
---

local inventory_list_one = {Us, Zs, Ys, Xs, Ws}
local inventory_list_two = {ft, gt, ht, jt, kt}

local function init()
    --- @param u unit
    --- @param id number
    --- @param target unit|point|nil
    et.game:event '单位-施放技能' (function(self, u, id, target)
        -- 切换背包
        local p = u:get_owner()
        if id == 1093677134 then
            log.debug('开始切换背包')
            for i = 1, 6 do
                inventory_list_one[p.id]:add_item(inventory_list_two[p.id]:get_item_in_slot(i))
            end
            for i = 1, 6 do
                inventory_list_two[p.id]:add_item(u:get_item_in_slot(i))
            end
            for i = 1, 6 do
                u:add_item(inventory_list_one[p.id]:get_item_in_slot(i))
            end
        end

        -- 切换物品
        local hu = et.unit(p.hero.handle)
        if id == 1093677133 and hu:is_alive() then
            log.debug('开始切换物品')
            Vs:add_item(u:get_item_in_slot(1))
            u:add_item(hu:get_item_in_slot(1))
            hu:add_item(Vs:get_item_in_slot(1))
        end
    end)

    -- 鸟的贩卖技能
    et.game:event '单位-技能生效' (function(self, u, id, target)
        if id == 1093679433 then
            log.debug('开始使用伴侣的贩卖技能')
            local p = u:get_owner()
            local last = p:create_unit(1853257068, rect_born:get_center())
            last:show(false)
            last:add_item(target)
            jass.UnitDropItemTarget(last.handle, last:get_item_in_slot(1).handle, Rs.handle)
            PlaySoundOnUnitBJ(Ih, 100, u.handle)
            jass.DestroyEffect(jass.AddSpecialEffectTarget("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", u.handle, "overhead"))
        end
    end)
end
init()