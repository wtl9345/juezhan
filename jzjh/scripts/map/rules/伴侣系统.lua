---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/15 21:44
---
--结成伴侣
local function init()
    -- 初始化伴侣属性
    et.lni_loader('partner') --读取伴侣属性到et.lni.partner表
    for k, v in pairs(et.lni.partner) do
        v.name = k
    end
    local temp = {}
    for k, v in pairs(et.lni.partner) do
        if v.item_id then
            temp[base.string2id(v.item_id)] = v
        end
        if v.unit_id then
            temp[base.string2id(v.unit_id)] = v
        end
    end
    for k, v in pairs(temp) do
        et.lni.partner[k] = temp[k]
    end
    et.game:event '单位-使用物品'(function(self, u, item)
        print(u:is_hero(), u:get_owner():is_player(), et.lni.partner[jass.GetItemTypeId(item)])
        if u:is_hero() and u:get_owner():is_player() and et.lni.partner[jass.GetItemTypeId(item)] then
            local h = u:get_owner().hero
            if h['伴侣'] then
                local unit_id = jass.GetUnitTypeId(h['伴侣'].handle)
                local former = et.lni.partner[unit_id]
                h['悟性'] = h['悟性'] - former['悟性']
                h['福缘'] = h['福缘'] - former['福缘']
                h['医术'] = h['医术'] - former['医术']
                h['根骨'] = h['根骨'] - former['根骨']
                h['经脉'] = h['经脉'] - former['经脉']
                h['胆魄'] = h['胆魄'] - former['胆魄']
                h['伴侣']:remove()
            end
            PlaySoundOnUnitBJ(Fh, 100, u)
            local new_partner_table = et.lni.partner[jass.GetItemTypeId(item)]
            local new_parter = u:get_owner():create_unit(new_partner_table.unit_id, u:get_point())
            zw(new_parter.handle, u, 1.0, 250.0, 1000.0, 1500.0, 75)
            p:send_message("|cFFFFCC00恭喜你与" .. new_partner_table.name .. "结成伴侣")
            h['伴侣'] = new_parter
            h['悟性'] = h['悟性'] + new_partner_table['悟性']
            h['福缘'] = h['福缘'] + new_partner_table['福缘']
            h['医术'] = h['医术'] + new_partner_table['医术']
            h['根骨'] = h['根骨'] + new_partner_table['根骨']
            h['经脉'] = h['经脉'] + new_partner_table['经脉']
            h['胆魄'] = h['胆魄'] + new_partner_table['胆魄']
        end
    end)
end
init()