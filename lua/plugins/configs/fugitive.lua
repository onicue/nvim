return{
  "tpope/vim-fugitive",
  lazy = true,
  event = "VeryLazy",
  keys = {
    {"<leader>gs", vim.cmd.Git},
  },
}
