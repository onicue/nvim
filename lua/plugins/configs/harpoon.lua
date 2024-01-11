return{
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim'},
  event = "VeryLazy",
  lazy = true,
  config = function ()
    require("telescope").load_extension('harpoon')
    require("harpoon").setup({
      global_settings = {
        tabline = false,
        enter_on_sendcmd = true,
        menu = {
          width = vim.api.nvim_win_get_width(0) - 20,
        },

      },
    })
  end
}
