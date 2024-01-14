local max_width = 80
local colorcoluml_len = tonumber(vim.o.colorcolumn)

return{
  "folke/zen-mode.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    window = {
      backdrop = 0.95,
      -- height = 0.5,
      width = (colorcoluml_len > max_width) and colorcoluml_len or max_width,
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        foldcolumn = "0", -- disable fold column
        colorcolumn = "0",
        list = false, -- disable whitespace characters
      },
    }
  },
}
