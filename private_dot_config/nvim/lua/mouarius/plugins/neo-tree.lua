return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  keys = {
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true })
      end,
      desc = "Explorer NeoTree",
    },
    {
      "<leader>eg",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git explorer",
    },
    {
      "<leader>eb",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Buffer explorer",
    },
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      event = "VeryLazy",
      version = "2.*",
      opts = {
        highlights = {
          statusline = {
            focused = {
              fg = "#f9e2af",
              bg = "#313244",
              bold = true,
            },
            unfocused = {
              fg = "#cdd6f4",
              bg = "#313244",
              bold = false,
            },
          },
        },
      },
    },
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    window = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    },
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
          "__pycache__"
        },
      },
      window = {
        mapping_options = {
          noremap = true,
          nowait = false,
        },
        mappings = {
          ["o"] = { "open", nowait = true },
          -- ["oc"] = { command = "none" },
          -- ["od"] = { command = "none" },
          -- ["og"] = { command = "none" },
          -- ["om"] = { command = "none" },
          -- ["on"] = { command = "none" },
          -- ["os"] = { command = "none" },
          -- ["ot"] = { command = "none" },
          ["O"] = { command = "show_help" },
          ["Oc"] = { command = "order_by_created" },
          ["Od"] = { command = "order_by_diagnostics" },
          ["Og"] = { command = "order_by_git_status" },
          ["Om"] = { command = "order_by_modified" },
          ["On"] = { command = "order_by_name" },
          ["Os"] = { command = "order_by_size" },
          ["Ot"] = { command = "order_by_type" },
        },
      },
    },
  },
}
