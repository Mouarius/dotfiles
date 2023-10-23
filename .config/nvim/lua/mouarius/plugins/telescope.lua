return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' ,{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }},
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
        vertical = {
          mirror = false,
        },
      },
    }
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local builtin = require('telescope.builtin')
    telescope.setup(opts)
    telescope.load_extension("harpoon")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end

}
