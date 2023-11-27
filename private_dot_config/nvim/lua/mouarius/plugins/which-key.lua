return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({})
    wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["^"] = { name = "+next" },
        ["¨"] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>h"] = { name = "+help" },
        ["<leader>n"] = { name = "+noice" },
        ["<leader>o"] = { name = "+open" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+split" },
        ["<leader>t"] = { name = "+tab" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })
  end
}

