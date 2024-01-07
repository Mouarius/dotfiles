local M = {}

vim.keymap.set("n", "^", "]", { remap = true })
vim.keymap.set("n", "¨", "[", { remap = true })
vim.keymap.set("n", "é", "^", { desc = "Go to beginning of line" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })


vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })

M.general = {
  n = {
    ["L"] = { "$", "Go to end of line" },
    ["H"] = { "^", "Go to beginning of line" },

		["<leader>nh"] = { "<cmd>nohl<cr>", "[N]o [H]ighlighting" },
		["<leader>sv"] = { "<cmd>vsplit<cr>", "Split vertically" },
		["<leader>sh"] = { "<cmd>split<cr>", "Split horizontally" },
		["<leader>sx"] = { "<cmd>close<cr>", "Close Split" },
		["<leader>se"] = { "<C-w>=", "Make split equal size" },
		-- tabs
		["<leader>tc"] = { "<cmd>tabnew<CR>", "Open new tab" },
		["<leader>tx"] = { "<cmd>tabclose<CR>", "Close current tab" },
		["<leader>tf"] = { "<cmd>tabnew %<CR>", "Open current buffer in new tab" },
		["<leader>tn"] = { "<cmd>tabnext<CR>", "Go to next tab" },
		["<leader>tp"] = { "<cmd>tabprev<CR>", "Go to previous tab" },

    -- Resize window using <ctrl> arrow keys
    ["<C-Up>"] = { "<cmd>resize +2<cr>", "Increase window height" },
    ["<C-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Increase window width" },

    ["<C-a>"] = {"GVgg", "Select the whole file"}
  },
  x = {
    ["<leader>p"] = { '"_dP', "Paste not deleted" },
  },
  v = {
    [">"] = { ">gv", "Indent selection" },
    ["<"] = { "<gv", "Deindent selection" },
  },
}

M.bufferline = {
  n = {
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "Go to next buffer" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "Go to previous buffer" },
    ["<leader>bl"] = { "<cmd>BufferLineMovePrev<CR>", "Move buffer tab to left" },
    ["<leader>bh"] = { "<cmd>BufferLineMovePrev<CR>", "Move buffer tab to left" },
  },
}

return M