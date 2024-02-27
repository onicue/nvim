-- plugin key bindings -> plugins.configs.<name-of-plagin>

----navigation----
vim.keymap.set("n", "<leader>l", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>bp<cr>")

vim.keymap.set("n", "<leader>qq", "<cmd>w | bd<cr>")
vim.keymap.set("n", "<leader>qz", "<cmd>bd<cr>")
-----movement-----
vim.keymap.set("i", "<C-l>", "<C-o>w")
vim.keymap.set("i", "<C-h>", "<C-o>b")

vim.keymap.set("n", "(g", vim.diagnostic.goto_next)
vim.keymap.set("n", ")g", vim.diagnostic.goto_prev)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
-----Quickfix-----

vim.keymap.set("n", "<leader>mk", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>mj", "<cmd>lprev<CR>zz")

-------sugar------
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
