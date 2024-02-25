local color = { link = "TermCursorNC" }

return{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", color),
    vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", color),
  },
  dependencies = {
      "MunifTanjim/nui.nvim",
  },

  config = function ()
    require("noice").setup({
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 1 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
      cmdline = {
        format = {
          lua = { icon = ""},
        },
      },
    })
  end
}
