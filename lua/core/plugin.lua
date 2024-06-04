local _o = require("configuration").mini
local onicue = {}

onicue.is_table = function(arg)
	return type(arg) == "table"
end

onicue.include = function()
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugin", [[v:val =~ '\.lua$']])) do
		MiniDeps.later(function()
			require("plugin." .. file:gsub("%.lua$", ""))
		end)
	end
end

-- TODO: colorful start
onicue.start = function()
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

onicue.install = function(args)
	if onicue.is_table(args) then
		for _, plugin in ipairs(args) do
			MiniDeps.add(plugin)
		end
	end
end

onicue.disable = function(args)
	if onicue.is_table(args) then
		for _, plugin in ipairs(args) do
			vim.g["loaded_" .. plugin] = 1
		end
	end
end

onicue.init = function()
	onicue.start()
	-- onicue.config = vim.tbl_extend("force", _o, opts) -- force? why?

	onicue.include()

	onicue.install(_o.install)
	onicue.disable(_o.disable)
end

return onicue
