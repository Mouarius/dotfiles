return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "BufReadPre",
  init = function()
    local mappings = require("mouarius.core.mappings").bufferline
    require("mouarius.core.utils").load_mappings(mappings)
  end,
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      offsets = {
        {
          filetype = "NvimTree",
        },
      },
    },
  },
}
