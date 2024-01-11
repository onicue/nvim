return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- event = "VeryLazy",
    -- lazy = true,
    config = function ()
      require('lualine').setup({
        options = {
          theme = "auto"
        }
      })
    end
}
