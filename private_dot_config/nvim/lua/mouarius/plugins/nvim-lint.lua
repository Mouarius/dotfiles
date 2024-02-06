return {
	"mfussenegger/nvim-lint",
	dependencies = { "williamboman/mason.nvim", "rshkarin/mason-nvim-lint" },
	config = function(_, opts)
		local utils = require("mouarius.core.utils")
		require("mason-nvim-lint").setup()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "flake8", "ruff", "mypy" },
		}

		local mypy = lint.linters.mypy
		local venv = utils.get_python_venv()
		if venv ~= nil then
			mypy.cmd = utils.get_python_venv() .. "/bin/mypy"
		end
		mypy.args = { "--show-error-codes" }
	end,
}
