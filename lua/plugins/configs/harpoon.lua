local opts = {noremap = true ,silent = true}

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
  end,
  keys = {
    {"<leader>a","<cmd>lua require('harpoon.mark').add_file()<cr>", opts},

    {"<Space>1","<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts},
    {"<Space>2","<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts},
    {"<Space>3","<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts},
    {"<Space>4","<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts},
    {"<Space>5","<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts},
    {"<Space>6","<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts},
    {"<Space>7","<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts},
    {"<Space>8","<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts},
    {"<Space>9","<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts},

    {"<space>hc", "<cmd>lua require('harpoon.mark').clear_all()<cr>", opts},

    {"<leader>j", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts},

    {"<space>t",
      function()
        local index = require("harpoon.mark").get_index_of(vim.fn.bufname())
        require("harpoon.mark").rm_file(index)
      end
    },

    {"<leader>n", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts},
    {"<leader>v", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts},
  },
}

