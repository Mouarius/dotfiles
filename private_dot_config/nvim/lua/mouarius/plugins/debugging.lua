return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			require("dapui").setup()
			local utils = require("mouarius.core.utils")

			local debugpy_env = "/home/mariusmenault/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			local django_dir = utils.find_django_project_directory(vim.fn.getcwd())

			require("dap-python").setup(debugpy_env)
			if django_dir then
				table.insert(require("dap").configurations.python, {
					type = "python",
					request = "launch",
					name = "Django HW (launch)",
					program = django_dir .. "/manage.py",
					args = { "runserver", "--noreload" },
				})
			end
		end,
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "DAP : Continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "DAP : Step over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "DAP : Step into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "DAP : Step out",
			},
			{
				"<leader>q",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>dt",
				function()
					require("dapui").toggle()
				end,
				desc = "DAP : Toggle UI",
			},
		},
	},
}
