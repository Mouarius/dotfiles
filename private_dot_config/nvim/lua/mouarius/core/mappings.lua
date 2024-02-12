local M = {}

vim.keymap.set("n", "^", "]", { remap = true })
vim.keymap.set("n", "¨", "[", { remap = true })
vim.keymap.set("n", "é", "^", { desc = "Go to beginning of line" })

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
		["L"] = { "$", { desc = "Go to end of line"} },
		["H"] = { "^", { desc = "Go to beginning of line"} },
		["<C-u>"] = { "<C-u>zz", { desc = "Scroll up and center" } },
		["<C-d>"] = { "<C-d>zz", { desc = "Scroll down and center" } },

		["<leader>nh"] = { "<cmd>nohl<cr>", { desc = "[N]o [H]ighlighting"} },
		["<leader>sv"] = { "<cmd>vsplit<cr>", { desc = "Split vertically"} },
		["<leader>sh"] = { "<cmd>split<cr>", { desc = "Split horizontally"} },
		["<leader>sx"] = { "<cmd>close<cr>", { desc = "Close Split"} },
		["<leader>se"] = { "<C-w>=", { desc = "Make split equal size"} },
		-- tabs
		["<leader>tc"] = { "<cmd>tabnew<CR>", { desc = "Open new tab"} },
		["<leader>tx"] = { "<cmd>tabclose<CR>", { desc = "Close current tab"} },
		["<leader>tf"] = { "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab"} },
		["<leader>tn"] = { "<cmd>tabnext<CR>", { desc = "Go to next tab"} },
		["<leader>tp"] = { "<cmd>tabprev<CR>", { desc = "Go to previous tab"} },

		-- Resize window using <ctrl> arrow keys
		["<C-Up>"] = { "<cmd>resize +2<cr>", { desc = "Increase window height"} },
		["<C-Down>"] = { "<cmd>resize -2<cr>", { desc = "Decrease window height"} },
		["<C-Left>"] = { "<cmd>vertical resize -2<cr>", { desc = "Decrease window width"} },
		["<C-Right>"] = { "<cmd>vertical resize +2<cr>", { desc = "Increase window width"} },

		["<C-a>"] = { "GVgg", { desc = "Select the whole file"} },
	},
	x = {
		["<leader>p"] = { '"_dP', { desc = "Paste not deleted"} },
	},
	v = {
		[">"] = { ">gv", { desc = "Indent selection"} },
		["<"] = { "<gv", { desc = "Deindent selection"} },
	},
}

return M
