local config = require("configuration")

local icons = icons or {}

local function is_table_empty(tbl)
  return next(tbl) == nil
end

function change_param(table)
  for k, v in pairs(table) do
    icons[k] = v
  end
end

local function init_icons()
  if not is_table_empty(icons) then
    return
  end

  if not is_table_empty(config) then
    -- icon
    if config.nerd_font then
      icons = {
        error = "",
        warn = "",
        hint = "",
        info = "",
        folder = "󰉋",
        opened_folder = "",
        empty_folder = "",
        file = "󰈔",
        tab_close = "󰅙",
        terminal = "",
        selected = "❯"
      }
      change_param(config.icon)
    -- text_icon
    else
      icons = {
        error = "e",
        warn = "w",
        hint = "h",
        info = "i",
        folder = "",
                    opened_folder = "",
                    file = "",
                    tab_close = "X",
                    terminal = "[t]",
                    selected = ">"
                }
      change_param(config.text_icon)
    end
  end
end

init_icons()
_G.icons = icons

return icons
