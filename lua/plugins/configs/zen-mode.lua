return{
  "folke/zen-mode.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    on_open = function(_)
      vim.cmd 'cabbrev <buffer> q let b:quitting = 1 <bar> q'
      vim.cmd 'cabbrev <buffer> wq let b:quitting = 1 <bar> wq'
    end,
    on_close = function()
      if vim.b.quitting == 1 then
        vim.b.quitting = 0
        vim.cmd 'q'
      end
    end,

    window = {
      backdrop = 0.90,
      -- height = 0.95,
      width = 80,
      options = {
        number = false,
        relativenumber = false,
        list = false,
      },
    }
  },
  keys = {
    {"<leader>zz", ":ZenMode<cr>", {silent = true, noremap = true}},
    {"<leader>zZ", function ()
      require("zen-mode").toggle({
        window = {
          width = 90
        }
      })
    end}
  }
}
