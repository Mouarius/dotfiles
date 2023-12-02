return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			enabled = vim.fn.executable("make") == 1,
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
		},
		{ "ThePrimeagen/refactoring.nvim" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local find_files_no_ignore = function()
			print("h")
			local action_state = require("telescope.actions.state")
			local line = action_state.get_current_line()
			require("telescope.builtin").find_files({ no_ignore = true, default_text = line })
		end
		local find_files_with_hidden = function()
			local action_state = require("telescope.actions.state")
			local line = action_state.get_current_line()
			require("telescope.builtin").find_files({ hidden = true, default_text = line })
		end
		return {
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
					vertical = {
						mirror = false,
					},
				},
				mappings = {
					i = {
						["î"] = find_files_no_ignore,
						["Ì"] = find_files_with_hidden,
						["<M-i>"] = find_files_no_ignore,
						["<M-I>"] = find_files_with_hidden,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-Down>"] = actions.cycle_history_next,
						["<C-Up>"] = actions.cycle_history_prev,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")
		telescope.load_extension("refactoring")
		telescope.load_extension("frecency")
		telescope.load_extension("noice")
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fr",
			"<cmd>Telescope frecency<cr>",
			desc = "Find files by frecency",
		},
		{
			"<leader>fo",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Find recent files",
		},
		{
			"<leader>fn",
			"<cmd>Telescope noice<cr>",
			desc = "Find noice",
		},
		{
			"<leader>ft",
			"<cmd>Telescope notify<cr>",
			desc = "Find notifications",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Find git_commits",
		},
		{
			"<leader>fgb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Find git_branches",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Find help",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Find grep under cursor",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Find Symbol",
		},
		{
			"<leader>fS",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "Find Symbol (Workspace)",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "Find LSP Definitions (Workspace)",
		},
		{
			"<leader>rr",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			mode = { "n", "x" },
			desc = "Telescope refactors",
		},
		{
			"gr",
			"<cmd>Telescope lsp_references <cr>",
			desc = "LSP: List references",
		},
		{
			"gd",
			"<cmd>Telescope lsp_definitions<CR>",
			desc = "LSP: find definitions",
		},
	},
}
