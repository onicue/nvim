return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',},
  event = "VeryLazy",
  config = function ()
    require('telescope').setup {
      defaults = {
        prompt_prefix = " ",
        show_line = false,
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        prompt_title = false,
        results_title = false,
        preview_title = false,
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
          horizontal = { mirror = false },
          vertical = { mirror = true },
        },
        file_ignore_patterns = {".git/*", ".cache", ".ssh"},
        winblend = 5,
        borderchars = {
        preview = { " ", " ", " ", " ", " ", " ", " ", " " },
        prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
        results = { " ", " ", " ", " ", " ", " ", " ", " " },
        },

        color_devicons = true,
        use_less = true,
        path_display = {},

        set_env = { ["COLORTERM"] = "truecolor" },

        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
            ["<C-j>"] = require('telescope.actions').move_selection_previous,
            ["<C-k>"] = require('telescope.actions').move_selection_next,
            ["<C-n>"] = false,
            ["<C-p>"] = false,
          },
        }

      },
      picker = {
        find_files = {
        hidden = true,
        prompt_title = false,
        previewer = false,
        results_title = false,
        preview_title = false,
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      },
    }}
  end,
  keys = {
    {"<leader>ff", ":Telescope find_files<cr>",{silent = true, noremap = true}},
    {'<leader>fg', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
    end},
    {"<leader>fb", ":Telescope buffers<cr>", {silent = true, noremap = true}}
  }
}
