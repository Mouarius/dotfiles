return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local logo = {
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[                                         ]],
      [[██╗  ██╗███████╗██╗     ██╗      ██████╗ ]],
      [[██║  ██║██╔════╝██║     ██║     ██╔═══██╗]],
      [[███████║█████╗  ██║     ██║     ██║   ██║]],
      [[██╔══██║██╔══╝  ██║     ██║     ██║   ██║]],
      [[██║  ██║███████╗███████╗███████╗╚██████╔╝]],
      [[╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ]],
      [[                                         ]],
    }
    dashboard.section.header.val = logo
    alpha.setup(dashboard.config)
  end,
  keys = {
    { "<leader>q", "<cmd>Alpha<CR>", desc = "Launch Alpha" },
  },
}
