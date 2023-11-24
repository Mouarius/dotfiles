return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = false,
		dependencies = {
			"folke/neodev.nvim",
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		keys = {
			{
				"<leader>cf",
				function()
					vim.lsp.buf.format()
				end,
				desc = "LSP: Format",
			},
			{
				"<leader>cr",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "LSP: Rename",
			},
			{
				"<leader>ca",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "LSP: Code actions",
			},
			{ "gd", vim.lsp.buf.definition, desc = "LSP : Goto definition" },
			{ "¨d", vim.diagnostic.goto_prev, desc = "LSP: Goto previous diagnostic" },
			{ "^d", vim.diagnostic.goto_next, desc = "LSP: Goto next diagnostic" },
			{
				"<leader>cd",
				function()
					vim.cmd("vsplit")
					local win = vim.api.nvim_get_current_win()
					local buf = vim.api.nvim_create_buf(true, true)
					vim.api.nvim_win_set_buf(win, buf)
					vim.lsp.buf.definition()
				end,
				desc = "LSP: Open definition in vsplit",
			},
		},
		opts = {
			diagnostics = {
				underline = true,
				severity_sort = true,
			},
		},
		config = function()
			require("neodev").setup({})
			local lsp_zero = require("lsp-zero").preset({})

			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			local lspconfig = require("lspconfig")

			lspconfig.volar.setup({
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
			})
			lspconfig.pyright.setup({
				root_dir = function(fname)
					local root_files = {
						"pyproject.toml",
						"setup.py",
						"setup.cfg",
						"requirements.txt",
						"Pipfile",
						"pyrightconfig.json",
						".git",
					}
					local util = require("lspconfig.util")
					local env_name = vim.fn.getenv("VIRTUAL_ENV")
					local EXPECTED_VIRTUAL_ENV = "/home/mariusmenault/dev/venv/hw"
					local is_hw_venv_activated = env_name == EXPECTED_VIRTUAL_ENV
					local file_path = vim.api.nvim_buf_get_name(0)
					local is_in_mysite = string.find(file_path, "^/home/mariusmenault/dev/greenday/mysite/") == 1
					if is_in_mysite and is_hw_venv_activated then
						return "/home/mariusmenault/dev/greenday/mysite"
					end
					return util.root_pattern(unpack(root_files))(fname)
				end,
			})

			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) configure lua language server
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
}
