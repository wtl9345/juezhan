---
--- 初始化读取lni文件
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/12/4 14:38
---

local function init()
    log.info('开始读取lni文件...')

    --- 读取装备属性
    et.lni_loader('weapon')
    et.lni_loader('clothes')
    et.lni_loader('helmet')
    et.lni_loader('shoe')
    et.lni_loader('accessory')
    et.lni_loader('deputy')
    et.lni.equipment = {}
    table.add_all(et.lni.equipment, et.lni.weapon)
    table.add_all(et.lni.equipment, et.lni.clothes)
    table.add_all(et.lni.equipment, et.lni.helmet)
    table.add_all(et.lni.equipment, et.lni.shoe)
    table.add_all(et.lni.equipment, et.lni.accessory)
    table.add_all(et.lni.equipment, et.lni.deputy)
    et.extend_lni(et.lni.equipment)

    --- 读取门派信息
    et.lni_loader('denomination')
    et.extend_lni(et.lni.denomination)
    for k, v in pairs(et.lni.denomination) do
        setmetatable(v, et.denomination)
    end

    --- 初始化伴侣属性
    et.lni_loader('partner') --读取伴侣属性到et.lni.partner表
    et.extend_lni(et.lni.partner)

    --- 初始化历练信息
    et.lni_loader('practice')
    et.extend_lni(et.lni.practice)

    --- 读取内功的lni文件
    et.lni_loader('internal')
    et.extend_lni(et.lni.internal)

    --- 读取内功的lni文件
    et.lni_loader('kungfu')
    et.extend_lni(et.lni.kungfu)

    --- 读取丹药信息
    et.lni_loader('pellet')
    et.extend_lni(et.lni.pellet)

    --- 读取草药信息
    et.lni_loader('herb')
    et.extend_lni(et.lni.herb)

    --- 读取任务信息
    et.lni_loader('task')
end
init()
