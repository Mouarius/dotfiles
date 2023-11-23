return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "folke/neodev.nvim",
    },
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
        "<leader>cd",
        function()
          vim.cmd("vsplit")
          local win = vim.api.nvim_get_current_win()
          local buf = vim.api.nvim_create_buf(true, true)
          vim.api.nvim_win_set_buf(win, buf)
          vim.lsp.buf.definition()
        end,
        desc = "LSP: Open definition in vsplit"
      }
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

        -- custom command
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })

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
            -- (Optional) configure lua language server
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })
    end,
  },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
}
