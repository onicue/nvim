-- plugin key bindings -> plugins.configs.<name-of-plagin>

----navigation----
vim.keymap.set("n", "<leader>l", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>bp<cr>")

vim.keymap.set("n", "<leader>qq", ":w | bd<cr>")
vim.keymap.set("n", "<leader>qz", ":bd<cr>")
-----movement-----
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>i")
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>i")

vim.keymap.set("v", "K", ":m '<-2<CR>'>gv")
vim.keymap.set("v", "J", ":m '>+1<CR>'<gv")

vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")

vim.keymap.set({"i", "n", "v"}, "<C-l>", "$")
vim.keymap.set({"i", "n", "v"}, "<C-h>", "0")

----indentation---

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")

-----Quickfix-----

vim.keymap.set("n", "<leader>mk", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>mj", "<cmd>lprev<CR>zz")

-------sugar------
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
