return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	keys = {
		{
			"<C-n>",
			function()
				require("neo-tree.command").execute({ toggle = true, reveal = true, position = "float" })
			end,
			desc = "Explorer NeoTree",
		},
		{
			"<leader>eg",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true, position = "float" })
			end,
			desc = "Git explorer",
		},
		{
			"<leader>eb",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true, position = "float" })
			end,
			desc = "Buffer explorer",
		},
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			event = "VeryLazy",
			version = "2.*",
			opts = {
				highlights = {
					statusline = {
						focused = {
							fg = "#f9e2af",
							bg = "#313244",
							bold = true,
						},
						unfocused = {
							fg = "#cdd6f4",
							bg = "#313244",
							bold = false,
						},
					},
				},
			},
		},
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
    enabme_diagnostics = true,
		window = {
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["o"] = "open",
				["oc"] = "noop",
				["od"] = "noop",
				["og"] = "noop",
				["om"] = "noop",
				["on"] = "noop",
				["os"] = "noop",
				["ot"] = "noop",
				["O"] = "order_by",
				["Oc"] = "order_by created",
				["Od"] = "order_by diagnostics",
				["Og"] = "order_by git_status",
				["Om"] = "order_by modified",
				["On"] = "order_by name",
				["Os"] = "order_by size",
				["Ot"] = "order_by type",
			},
		},
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					".DS_Store",
					"__pycache__",
				},
			},
			window = {
				mapping_options = {
					noremap = true,
					nowait = false,
				},
			},
		},
	},
}
