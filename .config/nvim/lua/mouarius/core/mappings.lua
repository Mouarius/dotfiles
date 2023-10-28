vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Scroll up and center"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Scroll down and center"})

-- windows
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", {desc = "Split vertically"})
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", {desc = "Split horizontally"})
vim.keymap.set("n", "<leader>x", "<cmd>close<cr>", {desc = "Close"})

-- tabs & buffers
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<Tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<S-Tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


-- VISUAL MODE
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
