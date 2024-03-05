return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },
  opts = function()
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_cmp()

    local cmp = require("cmp")
    local cmp_action = lsp_zero.cmp_action()
    local defaults = require("cmp.config.default")()
    local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-n>"] = cmp_action.luasnip_jump_forward(),
        ["<C-p>"] = cmp_action.luasnip_jump_backward(),
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp",  priority = 10 },
        { name = "luasnip", priority=1 },
        { name = "path" },
        { name = "buffer" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      sorting = defaults.sorting,
    }
  end,
}
