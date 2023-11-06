vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- windows
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", {desc = "Split vertically"})
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", {desc = "Split horizontally"})
vim.keymap.set("n", "<leader>x", "<cmd>close<cr>", {desc = "Close"})

vim.keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", {desc = "[N]o [H]ighlighting"})

-- tabs & buffers
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {desc = "Don't copy removed text", silent = true})
vim.keymap.set("x", "<leader>p", '"_dP', {desc = "Paste not deleted"})

-- VISUAL MODE
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

