local map = vim.keymap.set
local opts = { silent = true }

----navigation----
map("n", "<M-j>", "<cmd>m+1<cr>", opts)
map("n", "<M-k>", "<cmd>m-2<cr>", opts)
map("n", "<M-h>", "<cmd><<cr>", opts)
map("n", "<M-l>", "<cmd>><cr>", opts)

-- map("v", "<M-h>",":'<,'><|normal gv<cr>", opts) --need a silent!
-- map("v", "<M-l>",":'<,'>>|normal gv<cr>", opts)
-- map("v", "<M-k>",":'<,'>m '<-2|normal gv<cr>", opts)
-- map("v", "<M-j>",":'<,'>m '>+1|normal gv<cr>", opts)

map("n", "<Space>n", "<cmd>bn<cr>")
map("n", "<Space>v", "<cmd>bp<cr>")

-----harpoon------
map("n", "<leader>a",":lua require('harpoon.mark').add_file()<cr>", opts)

map("n", "<Space>1",":lua require('harpoon.ui').nav_file(1)<cr>", opts)
map("n", "<Space>2",":lua require('harpoon.ui').nav_file(2)<cr>", opts)
map("n", "<Space>3",":lua require('harpoon.ui').nav_file(3)<cr>", opts)
map("n", "<Space>4",":lua require('harpoon.ui').nav_file(4)<cr>", opts)
map("n", "<Space>5",":lua require('harpoon.ui').nav_file(5)<cr>", opts)
map("n", "<Space>6",":lua require('harpoon.ui').nav_file(6)<cr>", opts)
map("n", "<Space>7",":lua require('harpoon.ui').nav_file(7)<cr>", opts)
map("n", "<Space>8",":lua require('harpoon.ui').nav_file(8)<cr>", opts)
map("n", "<Space>9",":lua require('harpoon.ui').nav_file(9)<cr>", opts)

map("n", "<space>hc", "lua require('harpoon.mark').clear_all()<cr>", opts)

map("n", "<leader>j",":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)

map( "n","<space>t",
  function()
    local index = require("harpoon.mark").get_index_of(vim.fn.bufname())
    require("harpoon.mark").rm_file(index)
  end
)

map("n", "<leader>n", ":lua require('harpoon.ui').nav_next()<cr>", opts)
map("n", "<leader>v", ":lua require('harpoon.ui').nav_prev()<cr>", opts)

-----Telescope----
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)

-----NvimTree-----
map("n", "<leader>fj", "<cmd>NvimTreeToggle<cr>", opts)
