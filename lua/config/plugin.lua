local mini = require("core.plugin")

mini.init({
	plugin = {
		{
			source = "nvim-treesitter/nvim-treesitter",
			checkout = "master",
			hooks = {
				post_checkout = function()
					vim.cmd("TSUpdate")
				end,
			},
		},
	},
})
