return {
  'echasnovski/mini.indentscope', version = '*',
  event = "BufRead",
  lazy = true,

  config = function ()
    require('mini.indentscope').setup({})
  end
}
