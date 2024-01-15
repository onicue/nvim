require('core')
require('plugins')

--highlighting copied text--
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('YankHighlightGrp', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

--remove extra spaces--
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup('ThePrimeagen', {}),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

--do not autocomment when moving to a new line
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
