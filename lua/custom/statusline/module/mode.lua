local _o = require("general").ui.statusline.icon

local code = {
	["n"] = { "NORMAL", "Normal" },
	["no"] = { "NORMAL (no)", "Normal" },
	["nov"] = { "NORMAL (nov)", "Normal" },
	["noV"] = { "NORMAL (noV)", "Normal" },
	["noCTRL-V"] = { "NORMAL", "Normal" },
	["niI"] = { "NORMAL i", "Normal" },
	["niR"] = { "NORMAL r", "Normal" },
	["niV"] = { "NORMAL v", "Normal" },
	["nt"] = { "NTERMINAL", "NTerminal" },
	["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },

	["v"] = { "VISUAL", "Visual" },
	["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
	["V"] = { "V-LINE", "Visual" },
	["Vs"] = { "V-LINE", "Visual" },
	[""] = { "V-BLOCK", "Visual" },

	["i"] = { "INSERT", "Insert" },
	["ic"] = { "INSERT (completion)", "Insert" },
	["ix"] = { "INSERT completion", "Insert" },

	["t"] = { "TERMINAL", "Terminal" },

	["R"] = { "REPLACE", "Replace" },
	["Rc"] = { "REPLACE (Rc)", "Replace" },
	["Rx"] = { "REPLACEa (Rx)", "Replace" },
	["Rv"] = { "V-REPLACE", "Replace" },
	["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
	["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

	["s"] = { "SELECT", "Select" },
	["S"] = { "S-LINE", "Select" },
	[""] = { "S-BLOCK", "Select" },
	["c"] = { "COMMAND", "Command" },
	["cv"] = { "COMMAND", "Command" },
	["ce"] = { "COMMAND", "Command" },
	["r"] = { "PROMPT", "Confirm" },
	["rm"] = { "MORE", "Confirm" },
	["r?"] = { "CONFIRM", "Confirm" },
	["x"] = { "CONFIRM", "Confirm" },
	["!"] = { "SHELL", "Terminal" },
}

local qr = {}
qr.mode = function()
	local map = vim.api.nvim_get_mode().mode
	if code[map] == nil then
		return ""
	end

	return "%#St" .. code[map][2] .. "Mode#" .. _o.mode .. code[map][1]
end

return qr
