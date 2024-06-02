local opt = vim.opt
local g  = vim.g

g.mapleader = " "

opt.modifiable = true --for Lazy

opt.fileencoding = 'utf-8'

opt.confirm = false --raise a dialogue asking if you wish to save changed files
opt.virtualedit = "block"
-- opt.clipboard  = 'unnamedplus' -- using system buffer

----------ui-------------
opt.cmdheight = 0
opt.laststatus = 3

opt.background = "dark"

opt.list = true

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.colorcolumn = "0"
opt.cursorcolumn = false
opt.signcolumn = "no" -- auto/yes:1/no

opt.guicursor = "n:block,i-ci-c:ver25,r-v-cr:hor50,a:blinkon0"

opt.pumblend = 15
opt.winblend = 5
opt.pumheight = 10

opt.wrap = true  -- disable line wrap
g.nord_underline = 1 --for underline

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  diff = "/",
  eob = " ",
}

opt.termguicolors = true -- enable 24-bit RGB color in the TUI
-------interaction-------
opt.tabstop = 2
opt.shiftwidth = 0 -- number of spaces to use for each step of (auto)indent, 0 means use 'tabstop' value
opt.numberwidth = 3 --Indentation from the edge
opt.softtabstop = -1 -- number of spaces that a <Tab> counts for while performing editing operations, negative means use 'shiftwidth' valuept.textwidth = 80 -- set 80 character as default line length
opt.autoindent = false

opt.hlsearch = false
opt.showmatch = true -- highlight matching <[{()}]>

opt.mouse = "" -- ignore mouse completely

opt.splitright = true -- when :vsplit, put the new window right of the current one
opt.splitbelow = true -- when :split, put the new window below the current one
opt.splitkeep = "topline" -- when resizing or splitting a window, keep the top line the same

opt.fixeol     = false
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

opt.showtabline = 0

opt.expandtab = true
opt.scrolloff = 10
opt.visualbell = false

opt.helpheight = 15

--------swap|bufer-------
opt.backup = false --creates a backup in the current directory
opt.backupcopy = "auto" -- best option for backup strategy
opt.backupdir = ("%s/backup//"):format(vim.fn.stdpath("state"))
opt.backupskip:append({ "*/.git/*", "*.gpg" }) -- file patterns to ignore by 'backup'
opt.swapfile = false
opt.hidden = true -- enable switching unsaved buffer
opt.writebackup = true -- protect against crash during write
opt.undofile = true -- save undo history to an undo file on BufWrite
opt.undolevels = 100 -- maximum number of changes than can be undone

-------additionally------
opt.showmode = false -- hide current mode in command-line window
opt.breakindent = true -- continue indenting wrapped lines

opt.timeoutlen = 750
opt.updatetime = 500

opt.complete:remove({ -- disable scan for
  "u", -- unload buffers
  "t", -- tag completion
})

opt.shortmess = { -- shorten message in prompt window
  a = true,-- enable 'filmnrwx' flag
  o = true, -- overwrite message for writing a file with subsequent message for reading a file
  t = true, -- truncate file message at the start
  s = true, -- don't give "search hit/continuing *" message
  T = true, -- truncate other messages in the middle
  W = true, -- don't give "written" or "[w]" when writing a file
  I = true, -- don't give the intro message when starting Vim
  c = true, -- don't give ins-completion-menu messages
  C = true, -- don't give messages while scanning for ins-completion items
  F = true, -- don't give the file info when editing a file
  S = true, -- don't show search count message when searching
}

opt.wildmode = { "longest", "full" }
--------diagnostic-------

vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,

  --can be false
  virtual_text = {
    spacing = 0,
    prefix = '',
    source = false,
    virt_text_hide = false,
    virt_text_pos = 'right_align',
    suffix = "",
    format = function(diagnostic) --change if u wanna see the messages
        return ""
      end
  },

  float = {
    source = "if_many"
  },

  -- change highlight
  -- signs = {
  --       text = {
  --           [vim.diagnostic.severity.ERROR] = '',
  --           [vim.diagnostic.severity.WARN] = '',
  --           [vim.diagnostic.severity.HINT] = '',
  --           [vim.diagnostic.severity.INFO] = '',
  --       },
  --       linehl = {
  --           [vim.diagnostic.severity.ERROR] = '',
  --           [vim.diagnostic.severity.WARN] = '',
  --           [vim.diagnostic.severity.HINT] = '',
  --           [vim.diagnostic.severity.INFO] = '',
  --       },
  --       numhl = {
  --           [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
  --           [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
  --           [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
  --           [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
  --       },
  -- },
})
