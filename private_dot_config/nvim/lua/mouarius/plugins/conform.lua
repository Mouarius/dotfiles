return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black", "ruff_format" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      htmldjango = { "djlint" },
    },
  },
  keys = {

    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "LSP: Format",
    },
  },
}