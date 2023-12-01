return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		mason_null_ls.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
				-- "mypy",
				"djlint",
				"eslint_d",
			},
		})

		local sources = {
			null_ls.builtins.code_actions.refactoring,
			-- null_ls.builtins.code_actions.cspell,

			null_ls.builtins.completion.tags,
			-- null_ls.builtins.diagnostics.mypy.with({
			-- 	args = function(params)
			-- 		return { "--show-error-codes","--config-file", "mypy.ini", params.bufname }
			-- 	end,
			-- 	command = "/home/mariusmenault/dev/venv/hw/bin/mypy",
			-- 	-- prefer_local = "venv/hw/bin",
			-- 	-- cwd = function(_)
			-- 	-- 	return vim.fn.getcwd() .. "/mysite"
			-- 	-- end,
			-- }),
			-- null_ls.builtins.diagnostics.cspell,
			null_ls.builtins.diagnostics.djlint,
			null_ls.builtins.diagnostics.luacheck,
			null_ls.builtins.diagnostics.shellcheck,
			-- null_ls.builtins.diagnostics.ruff,
			null_ls.builtins.diagnostics.fish,

			-- null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.ruff,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.ruff_format,
		}
		null_ls.setup({
			-- debug = true,
			sources = sources,
		})
	end,
}
