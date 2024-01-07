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

			require("dap-python").setup("/home/mariusmenault/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			table.insert(require("dap").configurations.python, {
				type = "python",
				request = "attach",
        name = "Django",
				connect = { host = "127.0.0.1", port = 5738 },
				-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
			})
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
