return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require("lualine")
      local colors = require("catppuccin.palettes").get_palette "mocha"
      local custom_theme = {
        normal = {
          a = { fg = colors.base, bg = colors.mauve },
          b = { fg = colors.white, bg = colors.black},
          c = { fg = colors.white, bg = colors.black },
        z = {fg = colors.blue, bg = colors.black}
        },

        insert = { a = { fg = colors.black, bg = colors.teal } },
        visual = { a = { fg = colors.black, bg = colors.peach } },
        replace = { a = { fg = colors.black, bg = colors.red } },

        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.white, bg = colors.black},
        z = {fg = colors.blue, bg = colors.black}
        },
      }
      lualine.setup({
        options = {
          theme = custom_theme,
          extensions = { "nvim-tree" },
          section_separators = '',
          component_separators = '',
        },
        sections = {
          lualine_a = {
            { 'mode', right_padding = 2 },
          },
          lualine_b = { 'filename', 'branch' },
          lualine_c = { 'fileformat' },
          lualine_x = {},
          lualine_y = { 'filetype', 'progress' },
          lualine_z = {
            { 'location',  left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        })
      end
  }
