require 'lni.lni'

kongfu = {}
setmetatable(kongfu,kongfu)
et.kongfu = kongfu

local mt = {}
kongfu.__index = mt

mt.id = 0

mt.name = ''

mt.itemid = 0

mt.abilityid = 0

mt.type = ''

mt.conditions = {
	['悟性'] = 0,
	['根骨'] = 0,
	['经脉'] = 0,
	['医术'] = 0,
	['福缘'] = 0,
	['胆魄'] = 0,
}

function CunWuGong(num, id1, id2, s, dp1, fy1, gg1, jm1, wx1, ys1)
	kongfu[num] = {}
	kongfu[num].id = num
	kongfu[num].itemid = id1
	kongfu[num].abilityid = id2
	kongfu[num].type = s
	kongfu[num].conditions = {
		['悟性'] = wx1,
		['根骨'] = gg1,
		['经脉'] = jm1,
		['医术'] = ys1,
		['福缘'] = fy1,
		['胆魄'] = dp1,
	}
end

function kongfu.init()
	--顺序：胆魄、福缘、根骨、经脉、悟性、医术
	CunWuGong(1, 1227895626, 1093678913, "江湖武学", 0, 10, 0, 0, 14, 15)
	CunWuGong(2, 1227895624, 1093678664, "江湖武学", 14, 12, 18, 0, 0, 0)
	CunWuGong(3, 1227895382, 1093678929, "江湖内功", 0, 12, 0, 18, 0, 14)
	CunWuGong(4, 1227895381, 1093678928, "江湖内功", 17, 0, 0, 22, 0, 0)
	CunWuGong(5, 1227895623, 1093678668, "江湖武学", 0, 0, 0, 15, 10, 12)
	CunWuGong(6, 1227895386, 1093682254, "江湖内功", 17, 14, 18, 0, 0, 0)
	CunWuGong(7, 1227895384, 1093678931, "九阴内功", 0, 17, 17, 17, 20, 0)
	CunWuGong(8, 1227895625, 1093678926, "九阴武学", 13, 0, 12, 12, 16, 0)
	CunWuGong(9, 1227895385, 1093678932, "江湖内功", 22, 20, 0, 17, 0, 0)
	CunWuGong(10, 1227895627, 1093678666, "江湖武学", 14, 0, 0, 16, 20, 0)
	CunWuGong(11, 1227895620, 1093678927, "江湖内功", 0, 16, 0, 0, 0, 16)
	CunWuGong(12, 1227895628, 1093678925, "江湖武学", 0, 14, 14, 14, 14, 0)
	CunWuGong(13, 1227895600, 1093678935, "江湖内功", 0, 0, 0, 23, 18, 17)
	CunWuGong(14, 1227895601, 1093678933, "江湖内功", 18, 20, 16, 0, 0, 0)
	CunWuGong(15, 1227895621, 1093678669, "江湖武学", 0, 0, 18, 18, 0, 0)
	CunWuGong(16, 1227895603, 1093678897, "江湖武学", 0, 12, 0, 16, 0, 11)
	CunWuGong(17, 1227895383, 1093678930, "江湖内功", 0, 0, 0, 14, 12, 11)
	CunWuGong(18, 1227895622, 1093678672, "江湖武学", 0, 0, 22, 17, 15, 0)
	CunWuGong(19, 1227895609, 1093678919, "绝世武学", 18, 21, 27, 0, 0, 0)
	CunWuGong(20, 1227895604, 1093678924, "绝世武学", 20, 0, 26, 18, 0, 0)
	CunWuGong(21, 1227895608, 1093678918, "绝世武学", 0, 19, 0, 22, 28, 0)
	CunWuGong(22, 1227895607, 1093678920, "绝世武学", 17, 25, 0, 0, 17, 0)
	CunWuGong(23, 1227895618, 1093679158, "绝世武学", 0, 23, 20, 0, 29, 0)
	CunWuGong(24, 1227895602, 1093678917, "绝世武学", 24, 0, 30, 24, 0, 0)
	CunWuGong(25, 1227895605, 1093679157, "绝世武学", 0, 0, 0, 24, 19, 16)
	CunWuGong(26, 1227895606, 1093678922, "绝世武学", 23, 0, 0, 18, 0, 16)
	CunWuGong(27, 1227895619, 1093679161, "绝世武学", 23, 0, 0, 20, 22, 0)
	CunWuGong(28, 1227895617, 1093678921, "绝世武学", 25, 0, 25, 25, 20, 0)
	CunWuGong(29, 1227895635, 1093679154, "绝世内功", 22, 32, 0, 22, 0, 25)
	CunWuGong(30, 1227895631, 1093679156, "绝世内功", 28, 19, 0, 28, 0, 0)
	CunWuGong(31, 1227895636, 1395666994, "绝世内功", 20, 0, 29, 0, 0, 23)
	CunWuGong(32, 1227895633, 1093678936, "绝世内功", 0, 23, 31, 33, 0, 0)
	CunWuGong(33, 1227895629, 1093682232, "绝世内功", 28, 24, 0, 33, 0, 30)
	CunWuGong(34, 1227895632, 1093679152, "绝世内功", 25, 0, 0, 32, 22, 32)
	CunWuGong(35, 1227895637, 1093679155, "绝世内功", 0, 24, 0, 30, 24, 21)
	CunWuGong(36, 1227895634, 1093679428, "绝世内功", 0, 30, 0, 27, 34, 23)
	CunWuGong(37, 1227897159, 1093682226, "九阴内功", 0, 17, 17, 17, 20, 0)
	CunWuGong(38, 1227897160, 1093682228, "九阴内功", 0, 17, 17, 17, 20, 0)
	CunWuGong(39, 1227897161, 1093682230, "九阴内功", 0, 17, 17, 17, 20, 0)
	CunWuGong(40, 1227897162, 1093682225, "九阴武学", 13, 0, 12, 12, 16, 0)
	CunWuGong(41, 1227897163, 1093682227, "九阴武学", 13, 0, 12, 12, 16, 0)
	CunWuGong(42, 1227899698, 1093677902, "奇武", 0, 0, 0, 15, 14, 16)
	CunWuGong(43, 1227899699, 1093677904, "奇武", 0, 18, 26, 0, 0, 16)
	CunWuGong(44, 1227899700, 1093677900, "奇武", 12, 14, 16, 0, 0, 0)
	CunWuGong(45, 1227899701, 1093677905, "奇武", 17, 0, 0, 0, 20, 0)
	CunWuGong(46, 1227899702, 1093677903, "奇武", 14, 15, 16, 0, 0, 12)
	CunWuGong(47, 1227899704, 1093681989, "奇武", 12, 0, 0, 0, 18, 0)
	CunWuGong(48, 1227899705, 1093677908, "奇武", 14, 17, 0, 16, 0, 0)
	CunWuGong(49, 1227899713, 1093677909, "奇武", 0, 0, 0, 20, 0, 0)
	CunWuGong(50, 1227899714, 1093677911, "奇武", 0, 0, 0, 14, 14, 0)
	CunWuGong(51, 1227899715, 1093677910, "奇武", 0, 0, 0, 0, 15, 12)
	CunWuGong(52, 1227899716, 1093677914, "奇武", 13, 17, 16, 0, 0, 0)
	CunWuGong(53, 1227899722, 1093678166, "奇武", 15, 0, 16, 0, 17, 0)
	CunWuGong(54, 1227899732, 1093678657, "奇武", 15, 0, 15, 15, 15, 0) --《寿木长生功》
	CunWuGong(55, 1227899733, 1093678658, "奇武", 20, 20, 0, 18, 0, 0) --《黄沙万里鞭法》
	CunWuGong(56, 1227899734, 1093678675, "奇武", 0, 0, 0, 25, 0, 25) --《九阳真经散篇》
end



--万能装备系统
function Cun(id, name, s11, i11, s12, i12, s13, i13, s14, i14)
	local it = CreateItem(id, 0, 0)
	local l__hp = R2I(GetWidgetLife(it))
	local lv = 0
	if HaveSavedInteger(YDHT, id, id) == false then
		SaveInteger(YDHT, id, id, id)
	end
	if StringLength(s11) > 0 and i11 > 0 then
		SaveReal(YDHT, id, StringHash(s11), i11)
	end
	if StringLength(s12) > 0 and i12 > 0 then
		SaveReal(YDHT, id, StringHash(s12), i12)
	end
	if StringLength(s13) > 0 and i13 > 0 then
		SaveReal(YDHT, id, StringHash(s13), i13)
	end
	if StringLength(s14) > 0 and i14 > 0 then
		SaveReal(YDHT, id, StringHash(s14), i14)
	end
	SaveReal(YDHT, id, StringHash("升级概率"), 100.0)
	RemoveItem(it)
	it = nil
end

function Cuns()
	et.lni_loader('weapon')	
	et.lni_loader('clothes')	
	et.lni_loader('helmet')	
	et.lni_loader('shoe')	
	et.lni_loader('accessory')	
	et.lni_loader('deputy')	

	for k, v in pairs(et.lni.weapon) do
		print(k, v)
	end
end

Cuns()
kongfu.init() --存储武功