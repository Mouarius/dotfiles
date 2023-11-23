return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },"gbrlsnchs/telescope-lsp-handlers.nvim" },
	opts = {
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
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find grep",
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
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffers",
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
			"",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "Find Symbol (Workspace)",
		},
		{
			"<leader>fd",
			"",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "Find LSP Definitions (Workspace)",
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("harpoon")
		telescope.load_extension("refactoring")
		telescope.load_extension("lsp_handlers")
	end,
}
