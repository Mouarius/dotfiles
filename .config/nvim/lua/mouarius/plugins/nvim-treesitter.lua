return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
       highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "python",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "fish",
        },
      })
  end
}
