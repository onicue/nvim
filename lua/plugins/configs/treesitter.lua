return{
  'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  opts = {
    ensure_installed = { "c", "cpp", "markdown", "markdown_inline"},
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        disable = {},
      },
      modules = {
        highlight = {
          enable = true,
          disable = {},
      },
    }
  }
}
