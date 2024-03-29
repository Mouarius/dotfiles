return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"ruff",
				"mypy",
				"flake8",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "folke/neodev.nvim" },
			{ "folke/noice.nvim" },
		},
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			local lspconfig = require("lspconfig")

			lspconfig.pyright.setup({
				root_dir = function(fname)
					-- Change the default root_dir to fix auto-imports for django
					local root_files = {
						"manage.py",
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
					-- generalize this method
					local is_in_mysite = string.find(fname, "^/home/mariusmenault/dev/greenday/mysite/") == 1
					if is_in_mysite and is_hw_venv_activated then
						return "/home/mariusmenault/dev/greenday/mysite"
					end
					return util.root_pattern(unpack(root_files))(fname)
				end,
				settings = {
					pyright = {
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							ignore = { "*" },
							diagnosticMode = "openFilesOnly",
							autoImportCompletions = true,
							typeCheckingMode = "off",
						},
					},
				},
			})

			require("lspconfig").ruff_lsp.setup({
				on_attach = function(client, _bufnr)
					client.server_capabilities.hoverProvider = false
				end,
			})

			-- lspconfig.pylsp.setup({
			-- 	on_attach = function(client, _)
			-- 		client.server_capabilities.hoverProvider = false
			-- 	end,
			-- 	settings = {
			-- 		pylsp = {
			-- 			configurationSources = { "flake8" },
			-- 			plugins = {
			-- 				-- formatter options
			-- 				black = { enabled = false },
			-- 				autopep8 = { enabled = false },
			-- 				yapf = { enabled = false },
			-- 				-- linter options
			-- 				pylint = { enabled = false },
			-- 				-- executable = "pylint" },
			-- 				ruff = {
			-- 					enabled = false,
			-- 					config = "/home/mariusmenault/dev/greenday/pyproject.toml",
			-- 					ignore = "E501",
			-- 				},
			-- 				mccabe = { enabled = false },
			-- 				pyflakes = { enabled = false },
			-- 				flake8 = {
			-- 					enabled = false,
			-- 					maxLineLength = 88,
			-- 				},
			-- 				pycodestyle = { enabled = false },
			-- 				-- type checker
			-- 				pylsp_mypy = {
			-- 					enabled = true,
			-- 					report_progress = true,
			-- 					strict = true,
			-- 					-- overrides = { "--python-executable", py_path, true },
			-- 					live_mode = true,
			-- 					dmypy = false,
			-- 				},
			-- 				rope_autoimport = { enabled = false },
			-- 				-- auto-completion options
			-- 				jedi_completion = { enabled = false },
			-- 				jedi_hover = { enabled = false },
			-- 				jedi_symbols = { enabled = true },
			-- 				-- import sorting
			-- 				isort = { enabled = false },
			-- 			},
			-- 		},
			-- 	},
			-- })

			lspconfig.html.setup({
				filetypes = { "mjml", "html", "htmldjango" },
			})

			require("lspconfig").tsserver.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			})
			-- from lspconfig-all
			local util = require("lspconfig.util")
			local function get_typescript_server_path(root_dir)
				local global_ts = "/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib"
				local found_ts = ""
				local function check_dir(path)
					found_ts = util.path.join(path, "node_modules", "typescript", "lib")
					if util.path.exists(found_ts) then
						return path
					end
				end
				if util.search_ancestors(root_dir, check_dir) then
					return found_ts
				else
					return global_ts
				end
			end

			require("lspconfig").volar.setup({
				on_new_config = function(new_config, new_root_dir)
					new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
				end,
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ruff_lsp",
					"volar",
					"tsserver",
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})

			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
							},
						},
						view = "mini",
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = true,
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
		keys = {
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
			{
				"<space>wa",
				vim.lsp.buf.add_workspace_folder,
				desc = "Add folder to workspace",
				silent = true,
			},
			{
				"<space>wl",
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				desc = "List workspace folders",
			},
			{
				"<space>wr",
				vim.lsp.buf.remove_workspace_folder,
				desc = "Remove folder from workspace",
				silent = true,
			},
		},
	},
}
