---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by G_Seinfeld.
--- DateTime: 2018/11/06 11:47
---

local fogstate = {}

local mt = {}
fogstate.__index = mt

mt.type = 'fogstate'
mt.name = ''

function fogstate.init()
	local fogstate_names={}
	for i = 1, #fogstate_names do
		local fo = {}
		fo.name = fogstate_names[i]
		setmetatable(fo, fogstate)
		table.insert(fogstate, fo)
	end
end

return fogstate