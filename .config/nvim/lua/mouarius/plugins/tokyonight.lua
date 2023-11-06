  return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        transparent = true,
        style = "storm",
        sidebars = {"nvimtree"},
        dark_sidebar = false,
        dark_float = false,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {},
  }
