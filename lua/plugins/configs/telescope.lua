local opts = {silent = true, noremap = true}

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
        entry_prefix = " ",
        initial_mode = "insert",
        prompt_title = false,
        results_title = false,
        preview_title = false,
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            mirror = true,
            preview_height = 0.5,
            height = 0.7,
            preview_cutoff = 40,
            prompt_position = "bottom",
            width = 0.5
          },
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
        path_display = { "shorten"},

        set_env = { ["COLORTERM"] = "truecolor" },

        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
            ["<C-j>"] = require('telescope.actions').move_selection_next,
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
    {"<leader>ff", "<cmd>Telescope find_files<cr>", opts},
    {'<leader>fg', function()
      require('telescope.builtin').grep_string()
    end},
    {"<leader>fb", "<cmd>Telescope buffers<cr>", opts},
    {"<leader>xx", "<cmd>Telescope diagnostics<cr>", opts},
  }
}
