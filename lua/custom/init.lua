local _o = require("general").ui -- { statusline, tabline }
local opt = vim.opt

---------- statusline ----------
if _o.statusline.enable then
	opt.statusline = "%!v:lua.require('custom.statusline')()"
end

---------- tabline ----------
if _o.tabline.enable then
	if _o.tabline.smart then
		vim.api.nvim_create_autocmd({ "BufNew", "BufNewFile", "BufRead", "TabEnter", "TermOpen" }, {
			pattern = "*",
			group = vim.api.nvim_create_augroup("SmartTabline", {}),
			callback = function()
				if #vim.fn.getbufinfo({ buflisted = 1 }) >= 2 or #vim.api.nvim_list_tabpages() >= 2 then
					vim.opt.showtabline = 2
					vim.opt.tabline = "%!v:lua.require('custom.tabline')()"
					vim.api.nvim_del_augroup_by_name("SmartTabline")
				end
			end,
		})
	else
		vim.opt.showtabline = 2
		vim.opt.tabline = "%!v:lua.require('custom.tabline')()"
	end
end
