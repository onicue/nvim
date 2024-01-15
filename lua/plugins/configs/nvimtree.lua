return{
  "nvim-tree/nvim-tree.lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  lazy = false,
  config = function ()
    require("nvim-tree").setup({
      diagnostics = { enable = false },
      git = { enable = false },
      update_cwd = true,
      filters = { custom = { ".git" } },
    })

    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_width = 20
    vim.g.nvim_tree_special_files = {
      [[ "README.md" = 0 ]],
      [[ "MAKEFILE" = 0 ]],
      [[ "Makefile" = 0 ]],
    }
  end,
  keys = {
    {"<leader>fj", "<cmd>NvimTreeToggle<cr>", {silent = true, normal = true}}
  }
}
