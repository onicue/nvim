return{
  'echasnovski/mini.comment', version = '*',
  event = "VeryLazy",
  lazy = true,
  config = function ()
    require('mini.comment').setup({})
  end
}
