local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'J', api.tree.change_root_to_node,        opts('CD'))
  vim.keymap.set('n', 'H', api.tree.change_root_to_parent,        opts('UP'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

local opts = {silent = true, normal = true}

return{
  "nvim-tree/nvim-tree.lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  lazy = false,
  config = function ()
    require("nvim-tree").setup({
      on_attach = my_on_attach,
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
    {"<leader>fj", "<cmd>NvimTreeToggle<cr>", opts}
  }
}
