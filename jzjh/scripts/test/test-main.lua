---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/9 9:58
---

-- 修改SCRIPT_PATH即可
SCRIPT_PATH = 'F:\\personal\\heroaltar\\juezhan\\jzjh\\'


package.path = package.path .. ';'..SCRIPT_PATH..'?.lua'
package.path = package.path .. ';'..SCRIPT_PATH..'scripts\\?.lua'
package.path = package.path .. ';'..SCRIPT_PATH..'scripts\\test_frame\\?.lua'
package.cpath = package.cpath .. ';'..SCRIPT_PATH..'scripts\\test_frame\\jass\\clib\\?.dll'

local clib = require('clib')
local o_require = require

-- 重写require函数，可以加载中文路径
function require(modname)
    flag, r = pcall(o_require, modname)
    if not flag then
        r = o_require(clib.u2g(modname))
    end
    return r
end

require('scripts.main')


