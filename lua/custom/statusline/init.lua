local _o = require("configuration").ui.statusline
local qr = {}

---------- %= ----------
qr["%="] = "%="

---------- seperator ----------
local hl = vim.api.nvim_set_hl

for k, v in pairs(_o.seperator) do
	hl(0, "StSep" .. k, { fg = v[2], bg = v[3], bold = v[4] })
	qr["_" .. k] = "%#StSep" .. k .. "#" .. v[1]
end

---------- module ----------
for _, file in ipairs(_o.order) do
	if file:sub(1, 1) ~= "_" and file ~= "%=" then
		local module = require("custom.statusline.module." .. file)
    for k, v in pairs(module) do
      qr[k] = v
    end
	end
end

---------- return str ----------
return function()
	local str = {}
	for _, v in ipairs(_o.order) do
		table.insert(str, type(qr[v]) == "string" and qr[v] or qr[v]())
	end

	return table.concat(str)
end
