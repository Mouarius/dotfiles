local opt = vim.opt -- for conciseness

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.title = true
opt.syntax = "on"
opt.errorbells = false
opt.showcmd = true
opt.cmdheight = 1
opt.shell = "fish"

-- line numbers
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.breakindent = true
opt.smartindent = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.path:append({ "**" })
opt.wildignore:append({ "*node_modules/*" })

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

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "~/.local/share/chezmoi/*",
	command = "chezmoi apply --source-path '%' && echo 'successfully applied chezmoi changes'",
})
