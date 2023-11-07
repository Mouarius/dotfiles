return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()
      lsp_zero.setup()

      lsp_zero.on_attach(function(client, bufnr)
        -- keymaps
        lsp_zero.default_keymaps({ buffer = bufnr })


        -- custom command
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end)

      local lspconfig = require("lspconfig")

      -- config for lsp suggestions for nvim lua
      lspconfig.lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
              not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
          then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = "LuaJIT",
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  },
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                  -- library = vim.api.nvim_get_runtime_file("", true)
                },
              },
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end,
      })

      lspconfig.cssls.setup({
        filetypes = { "css", "scss", "less", "html", "htmldjango" }

      })

        vim.keymap.set("n", "ùd", vim.diagnostic.goto_next, { desc = "Goto next diagnostics" })
        vim.keymap.set("n", "%D", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostics" })

      require("mason").setup({
        ensure_installed = {
          "mypy",
          "ruff",
          "black",
          "xo",
          "stylua",
          "cssls"
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "html",
          "cssls",
          "jsonls",
          "eslint",
          -- python
          "pyright",
          "stylelint"
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end,
  },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
}
