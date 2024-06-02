-- plugins key bindings -> plugins.configs.<name-of-plagin>

----navigation----

vim.keymap.set("n", "<leader>l", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>bp<cr>")

vim.keymap.set("n", "<leader>qq", "<cmd>w | bd<cr>")
vim.keymap.set("n", "<leader>qz", "<cmd>bd<cr>")

-----movement-----

vim.keymap.set("i", "<C-l>", "<S-Right>")
vim.keymap.set("i", "<C-h>", "<S-Left>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true,})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true,})

-----Quickfix-----

vim.keymap.set("n", "<leader>mk", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>mj", "<cmd>lprev<CR>zz")

-------sugar------

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({"n","v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>au", function ()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

----diagnostic----

vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_prev)
vim.keymap.set("n", "J", vim.diagnostic.open_float)
