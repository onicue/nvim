return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "auto",
      options = {
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ' '},
      },
      sections = { lualine_a = {
        { 'mode', fmt = function(str) return str:sub(1,1) end } },
      },
    }
}
