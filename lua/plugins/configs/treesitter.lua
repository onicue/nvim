return{
  'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',

  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "cpp", "markdown"},
      sync_install = true,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = "yaml" },
      rainbow = { enable = true, extended_mode = false },
      context_commentstring = { enable = true, enable_autocmd = false },
      autopairs = { enable = true },
      autotag = { enable = true, filetypes = { "html", "markdown" } },
      additional_vim_regex_highlighting = false,
    }

    require("nvim-treesitter.install").prefer_git = true
  end
}
