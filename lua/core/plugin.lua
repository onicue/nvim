local M = {}

M.config = {
	plugins = {},
	disabled_plugins = {},
	config_dir = "plugin",
}

local function check_table(arg)
	if type(arg) ~= "table" then
		vim.api.nvim_err_writeln("Invalid argument: expected table")
		return false
	else
		return true
	end
end

local function require_all_files_in_directory(directory)
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. directory, [[v:val =~ '\.lua$']])) do
		MiniDeps.later(function()
			require(directory .. "." .. file:gsub("%.lua$", ""))
		end)
	end
end

M.start_mini_deps = function()
	local path_package = vim.fn.stdpath("data") .. "/site/"
	local mini_path = path_package .. "pack/deps/start/mini.nvim"
	if not vim.loop.fs_stat(mini_path) then
		vim.cmd('echo "Installing `mini.nvim`" | redraw') --TODO change preview
		local clone_cmd = {
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/echasnovski/mini.nvim",
			mini_path,
		}
		vim.fn.system(clone_cmd)
		vim.cmd("packadd mini.nvim | helptags ALL")
		vim.cmd('echo "Installed `mini.nvim`" | redraw')
	end

	-- Set up 'mini.deps' (customize to your liking)
	require("mini.deps").setup({ path = { package = path_package } })
end

M.install_plugins = function(args)
	if check_table(args) then
		for _, arg in ipairs(args) do
			MiniDeps.add(arg)
		end
	end
end

M.disable_plugins = function(args)
	if check_table(args) then
		for i = 1, #args do
			vim.g["loaded_" .. args[i]] = 1
		end
	end
end

M.setup = function(opts)
	M.start_mini_deps()
	M.config = vim.tbl_extend("force", M.config, opts)

	local config_dir = M.config.config_dir
	if config_dir and config_dir ~= "" then
		require_all_files_in_directory(config_dir)
	end

	M.install_plugins(M.config.plugins)
	M.disable_plugins(M.config.disabled_plugins)
end

return M
