-- local color = require("custom.base66")

return {
	plugin = {}, -- plugin

	ui = {
		statusline = {
			enable = true, -- ui.statusline.enable

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
}
