return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		mason_null_ls.setup({})

		local sources = {
			null_ls.builtins.completion.tags,

			null_ls.builtins.diagnostics.fish,
			null_ls.builtins.diagnostics.djlint.with({}),

			-- Formatters are used through conform.nvim
		}
		if vim.fn.executable("djlint") then
			sources[#sources + 1] =
				null_ls.builtins.formatting.djlint.with({ command = "djlint", args = { "--reformat", "--" } })
		end
		null_ls.setup({
			sources = sources,
		})
	end,
}
