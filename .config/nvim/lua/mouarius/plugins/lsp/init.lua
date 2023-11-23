return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        severity_sort = true,
      },
    },
    config = function()
      require("neodev").setup({})
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      local lspconfig = require("lspconfig")

      lspconfig.volar.setup({
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      })

      require("mason").setup({})
      require("mason-lspconfig").setup({
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })
    end,
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
      {
        "gd",
        "<cmd>Telescope lsp_definitions<CR>",
        desc = "LSP: find definitions",
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
  },
}
