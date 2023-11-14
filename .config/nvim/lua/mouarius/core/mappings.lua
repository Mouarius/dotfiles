vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Scroll up and center"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Scroll down and center"})

-- windows
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", {desc = "Split vertically"})
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", {desc = "Split horizontally"})
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", {desc = "Close"})
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", {desc = "Quit"})

vim.keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", {desc = "[N]o [H]ighlighting"})

-- tabs & buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {desc = "Don't copy removed text", silent = true})
vim.keymap.set("x", "<leader>p", '"_dP', {desc = "Paste not deleted"})

-- VISUAL MODE
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

