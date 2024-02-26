return{
  'lewis6991/gitsigns.nvim',
  event = "VeryLazy",
  lazy = true,
  config = function ()
    require('gitsigns').setup({})
  end
}
