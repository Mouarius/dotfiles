return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local colors = require("catppuccin.palettes").get_palette("mocha")
    local custom_theme = {
      normal = {
        a = { fg = colors.base, bg = colors.yellow },
        b = { fg = colors.subtext1, bg = colors.base },
        c = { fg = colors.subtext1, bg = colors.base },
        z = { fg = colors.yellow, bg = colors.base },
      },

      insert = {
        a = { fg = colors.base, bg = colors.green },
        z = { fg = colors.green, bg = colors.base },
      },
      visual = {
        a = { fg = colors.base, bg = colors.mauve },
        z = { fg = colors.mauve, bg = colors.base },
      },
      replace = {
        a = { fg = colors.base, bg = colors.red },
        z = { fg = colors.red, bg = colors.base },
      },

      inactive = {
        a = { fg = colors.text, bg = colors.base },
        b = { fg = colors.subtext1, bg = colors.base },
        c = { fg = colors.subtext1, bg = colors.base },
        z = { fg = colors.yellow, bg = colors.base },
      },
    }
    lualine.setup({
      options = {
        theme = custom_theme,
        extensions = { "nvim-tree" },
        section_separators = { left = "", right = "" },
        component_separators = "",
      },
      sections = {
        lualine_a = {
          { "mode", right_padding = 2 },
        },
        lualine_b = {
          { "filename", file_status = false, path = 1 },
          "branch",
          {
            "diagnostics",
            source = { "nvim" },
            sections = { "error" },
            diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
          },
          {
            "diagnostics",
            source = { "nvim" },
            sections = { "warn" },
            diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}
