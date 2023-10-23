return {
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.setup()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "html",
          "cssls",
          "jedi_language_server"
        },
        handlers = {
          lsp_zero.default_setup,
        }
      })
    end
  },
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
}
