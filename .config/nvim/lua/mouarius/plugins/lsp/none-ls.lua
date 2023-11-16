return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.refactoring,

      null_ls.builtins.completion.tags,

      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.codespell,
      null_ls.builtins.diagnostics.djlint,
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.diagnostics.fish,

      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.stylua,
    }
    null_ls.setup({ sources = sources })
  end,
}
