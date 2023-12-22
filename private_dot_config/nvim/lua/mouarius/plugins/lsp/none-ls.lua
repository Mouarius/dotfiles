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
        "eslint_d",
      },
    })

    local sources = {

      null_ls.builtins.code_actions.eslint,

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
      null_ls.builtins.diagnostics.fish,
      null_ls.builtins.diagnostics.tsc,

      null_ls.builtins.diagnostics.djlint.with({
        prefer_local = "venv/hw/bin",
      }),

      -- Formatters are used through conform.nvim
    }
    null_ls.setup({
      sources = sources,
    })
  end,
}
