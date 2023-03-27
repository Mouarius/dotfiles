local opt = vim.opt -- for conciseness

opt.title = true
opt.syntax = "on"
opt.errorbells = false

-- line numbers
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- tabs & indentation
opt.tabstop = 8
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
