-- local color = require("custom.66").base_10

return {
	plugin = {
		install = {
			{
				source = 'nvim-treesitter/nvim-treesitter',
				checkout = 'master',
				hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
			},
		},
		disable = {},
	},

	ui = {
		base66 = {
			enable = true,
			theme = "gruvbox",
		}, -- ui.base66

		statusline = {
			enable = true, -- ui.statusline.enable

			setup = {
				date = "f",
			},

			icon = {
				mode = "  ",
			}, -- ui.statusline.icon

			--[[
			--["key"] = { "sep", "#foreground", "#background", bold },
			--["q"] = { "/", "#AFF3BD", "#FADDFD", true },
			--]]
			seperator = {
				["l"] = { "+", "#FDFDFD", "#e2abd3", true },
				["f"] = { "-", "#EDADaF", "#DDDDDD", false },
				["s"] = { ":", "#1e2abd", "#BFD32A", false },
			}, -- ui.statusline.seperator

			order = { "mode", "_l", "git", "_s", "_f", "%=" }, -- ui.statusline.order
		}, -- ui.statusline

		tabline = {
			enable = true, -- ui.tabline.enable
			smart = true, -- ui.tabline.smart
		}, -- ui.tabline
	}, -- ui

	nerd = true,
	icon = {}, -- overwrite icons
	text_icon = {},
}
