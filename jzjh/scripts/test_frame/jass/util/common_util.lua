---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/1 11:43
---

local common = {}
local handle_id = {}

function common.generate_handle_id()
    local id = 0x100000001
    if #handle_id ~= 0 then
        id = handle_id[#handle_id] + 1
    end
    table.insert(handle_id, id)
    return id
end

return common