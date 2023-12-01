return {
  "folke/noice.nvim",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  keys = function()
    local noice = require("noice")
    return {
      {
        "<leader>nl",
        function()
          noice.cmd("last")
        end,
        desc = "Noice last",
      },
    }
  end,
}
