local indent = 4
vim.o.clipboard = "unnamedplus"                    -- have vim use OS clipboard
vim.o.completeopt = "menuone,noinsert,noselect"    -- autocomplete options
vim.o.expandtab = true                             -- expand tabs into spaces
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.smartcase = true
vim.cmd("syntax off")
vim.o.termguicolors = true                         -- enable true color
vim.o.tabstop = indent
vim.o.shiftwidth = indent
vim.o.pumheight = 12                               -- maximum autocomplete popup height
vim.o.timeoutlen = 200                             -- note that this controls which-key.nvim
vim.o.textwidth = 100
vim.o.splitright = true                            -- open splits on the right by default
vim.o.number=true
vim.o.laststatus=2
vim.o.noshowmode=false  -- Because we have powerline
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('~/.vim/undodir')
vim.o.mapleader=";"
vim.o.colorscheme="gruvbox"
vim.o.background="dark"
vim.cmd('colorscheme gruvbox')
