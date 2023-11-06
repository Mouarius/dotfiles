return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavor = "mocha",
      transparent_background = false,
      integrations = {
        nvimtree = true
      }
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
