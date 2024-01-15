require("core.options")
require("core.keymaps")

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
