--highlighting copied text--
local TextYankPost = vim.api.nvim_create_augroup('YankHighlightGrp', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = TextYankPost,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

--remove extra spaces--
local ThePrimeagen = vim.api.nvim_create_augroup('ThePrimeagen', {})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = ThePrimeagen,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
