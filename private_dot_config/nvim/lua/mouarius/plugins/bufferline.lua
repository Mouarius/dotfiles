return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      offsets = {
        {
          filetype = "neo-tree",
        },
      },
    },
  },
  keys = {
    { "<Tab>",      "<cmd>BufferLineCycleNext<CR>", desc = "Go to next buffer" },
    { "<S-Tab>",    "<cmd>BufferLineCyclePrev<CR>", desc = "Go to previous buffer" },
    { "<leader>bl", "<cmd>BufferLineMovePrev<CR>",  desc = "Move buffer tab to right" },
    { "<leader>bh", "<cmd>BufferLineMovePrev<CR>",  desc = "Move buffer tab to left" },
    { "<leader>bX", "<cmd>BufferLineCloseOthers<CR>",  desc = "Close all other buffers" },
    { "<leader>bxl", "<cmd>BufferLineCloseRight<CR>",  desc = "Close buffers on the right" },
    { "<leader>bxh", "<cmd>BufferLineCloseLeft<CR>",  desc = "Close buffers on the left" },
  },
}
