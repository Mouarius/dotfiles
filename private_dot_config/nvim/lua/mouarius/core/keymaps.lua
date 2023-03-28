vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "d", '"_d', { noremap = true })
keymap.set("n", "x", '"_x', { noremap = true })
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sp", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("n", "<leader>te", ":terminal<CR>")

-- plugins keymaps
keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- move nvim
local move_opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", move_opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", move_opts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", move_opts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", move_opts)

-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", move_opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", move_opts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", move_opts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", move_opts)
