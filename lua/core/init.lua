require("core.options")
require("core.keymaps")

local YankHighlightGrp = vim.api.nvim_create_augroup('YankHighlightGrp', {}) -- highlight copy lines
vim.api.nvim_create_autocmd('TextYankPost', {
	group = YankHighlightGrp,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

local ThePrimeagenGroup = vim.api.nvim_create_augroup('ThePrimeagen', {}) --remove extra spaces
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

--do not autocomment when moving to a new line
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

Bg = ''

local function getNormal()
    local hl_statusline = vim.fn.synIDtrans(vim.fn.hlID("Normal"))
    return vim.fn.synIDattr(hl_statusline, 'bg', 'gui')
end
function Transparency(transparency)

    if transparency then
        local var = getNormal()
        if Bg == '' or (var ~= Bg and var ~= '')  then
          Bg = var
        end

        if transparency == 'false' or transparency == '0' then
          vim.cmd('highlight Normal guibg=' .. Bg)
        elseif transparency == 'true' or transparency== '1' then
          vim.cmd('highlight Normal guibg=NONE')
        else
          print('incorrect argument')
        end
    else
      print('transparency not fill')
    end
end

vim.api.nvim_command('command! -nargs=+ -range Transparency :lua Transparency(<q-args>)')
