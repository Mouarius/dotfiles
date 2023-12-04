local opt = vim.opt

os.setlocale("en_US.UTF-8")
vim.g.mapleader = " "

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- line numbers
opt.relativenumber = true
opt.number = true

-- indent & tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- searching
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"


-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = "unnamedplus"

-- split window
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

opt.laststatus = 3
opt.cmdheight = 0
opt.showmode = false
