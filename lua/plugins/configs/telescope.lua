return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',},
  event = "VeryLazy",
  config = function ()
    require('telescope').setup {
      defaults = {
        -- sorting_strategy = "actions",
        layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "true" },
        border = false,
      },
      extensions = {},
      file_browser = {},
    }
  end
}
