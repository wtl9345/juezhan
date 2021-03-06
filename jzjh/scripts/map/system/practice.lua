

local function task_fail(pr, u)
    local p = u:get_owner()
    local h = p.hero
    if jass.RectContainsUnit(pr.regions.total, u.handle) then
        u:set_point(pr.regions.fail:get_center())
        p:set_camera(pr.regions.fail:get_center())
    end
    p:send_message("|cFFFF0000时间到，任务失败了")
    PlaySoundOnUnitBJ(Gh, 100, u.handle)
    h.practice_tasks[pr.name] = { status = 'fail', count = 0 }
end

function et.hero.__index:init_practice_task(pr)
    self.practice_tasks[pr.name] = { status = 'ongoing' }
    for k, v in pairs(pr.creeps) do
        self.practice_tasks[pr.name][k] = 0
    end
end

local function init()
    log.info('加载历练系统')
    -- 从商店购买任务物品
    et.game:event '单位-捡起物品'(function(self, u, item)
        local id = item:get_id()
        if et.lni.practice[id] and u:is_hero() then
            local pr = et.lni.practice[id]
            local p = u:get_owner()
            local h = p.hero

            -- 等级不足
            if u:get_level() < pr.requirements.level then
                p:send_message("|cFFFF0000等级不足" .. pr.requirements.level .. "级无法接取该任务")
                return
            end

            -- 声望不足
            if h.reputation < pr.requirements.reputation then
                p:send_message("|cFFFF0000江湖声望不足" .. pr.requirements.reputation .. "无法接取该任务")
                return
            end

            -- 历练不足
            if h.practice < pr.requirements.practice then
                p:send_message("|cFFFF0000你必须先完成历练" .. pr.requirements.practice .. "任务")
                local x, y = pr.regions.ping:get_center():get()
                force.ping_minimap(x, y, 5)
                return
            end

            -- 已完成任务
            if h.practice >= pr.level then
                p:send_message("|cFFFF0000你已经完成这个任务了")
                return
            end

            -- 进入任务区域
            u:set_point(pr.regions.enter:get_center())
            p:set_camera(pr.regions.enter:get_center())
            -- 给出提示信息
            p:send_message(pr.hints.task)
            if not h.practice_tasks[pr.name] or h.practice_tasks[pr.name].status ~= 'ongoing' then

                -- 有时间限制的任务，展示对话框，时间到后任务失败
                if pr.time_limit then
                    et.timerdialog(pr.time_limit, pr.hints.timer)
                    et.wait(pr.time_limit * 1000, function()
                        task_fail(pr, u)
                    end)
                end

                -- 初始化历练任务
                h:init_practice_task(pr)
            end

        end
    end)
    et.game:event '单位-死亡'(function(self, killer, killed)
        if killer:is_hero() and killer:get_owner():is_player() then
            local p = killer:get_owner()
            local h = p.hero
            local task_name

            -- 判断是否有正在进行的历练任务
            for k, v in pairs(h.practice_tasks) do
                if k.status == 'ongoing' then
                    task_name = k
                end
            end
            if not task_name then
                return
            end
            local pr = et.lni.practice[task_name]

            -- 判断是否完成任务
            local flag = true
            for k, v in pairs(pr.creeps) do
                if killed:get_id() == k and h.practice_tasks[task_name][k] < v then
                    h.practice_tasks[task_name][k] = h.practice_tasks[task_name][k] + 1
                end
                if h.practice_tasks[task_name][k] < v then
                    flag = false
                end
            end

            -- 分别处理完成任务和未完成任务的逻辑
            if flag then
                p:send_message(pr.hints.success)
                PlaySoundOnUnitBJ(Hh, 100, killer)
                h.practice = h.practice + 1
                h.practice_eff = h.practice_eff + pr.awards.practice_eff
                h.practice_tasks[task_name].status = 'complete'
                h:add_all_attr()
                killer:set_point(pr.regions.success:get_center())
                p:set_camera(pr.regions.success:get_center())
                for k, v in pairs(pr.items) do
                    if commonutil.random_int(1, 100) < v then
                        killer:add_item(base.string2id(k))
                    end
                end
            else
                p:send_message("|cFFFFCC00当前进度：")
                for k, v in pairs(pr.creeps) do
                    p:send_message("|cFFFFCC00" .. jass.GetObjectName(base.string2id(k)) .. ":" .. h.practice_tasks[task_name][k] .. "/" .. v)
                end
            end
        end
    end)
end

init()