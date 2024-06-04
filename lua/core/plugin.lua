local _o = require("general").plugin
local M = {}

M.is_table = function(arg)
	return type(arg) == "table"
end

M.include = function()
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugin", [[v:val =~ '\.lua$']])) do
		MiniDeps.later(function()
			require("plugin." .. file:gsub("%.lua$", ""))
		end)
	end
end

-- TODO: colorful start
M.start = function()
  local path_package = vim.fn.stdpath("data") .. "/site/"
  local mini_path = path_package .. "pack/deps/start/mini.nvim"
  if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing mini.nvim" | redraw')
    local clone_cmd = {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/echasnovski/mini.nvim",
      mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd('echo "Installed mini.nvim" | redraw')
  end

  require("mini.deps").setup({ path = { package = path_package } })
end

M.install = function(args)
	if M.is_table(args) then
		for _, plugin in ipairs(args) do
			MiniDeps.add(plugin)
		end
	end
end

M.disable = function(args)
	if M.is_table(args) then
		for _, plugin in ipairs(args) do
			vim.g["loaded_" .. plugin] = 1
		end
	end
end

M.init = function()
	M.start()
	M.include()

	M.install(_o.install)
	M.disable(_o.disable)
end

return M
