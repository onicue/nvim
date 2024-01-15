return{
 "ellisonleao/gruvbox.nvim",
 config = function ()
  require("gruvbox").setup({
    italic = {
      strings = false,
      emphasis = true,
      comments = false,
      operators = false,
      folds = false,
    },
    overrides = {
        -- TelescopeNormal = {bg = "#000000"}
    }
  })
  vim.cmd('colorscheme gruvbox')
  vim.cmd("hi link TelescopeNormal CursorLineSign")
 end
}
