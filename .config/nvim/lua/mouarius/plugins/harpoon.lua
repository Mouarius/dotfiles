return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({})
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>mm",
      "<cmd>lua require('harpoon.mark').add_file()<CR>",
      { desc = "Mark file with harpoon" , silent = true}
    )
    keymap.set(
      "n",
      "<leader>mn",
      "<cmd>lua require('harpoon.ui').nav_next()<cr>",
      { desc = "Go to next harpoon mark" , silent = true }
    )
    keymap.set(
      "n",
      "<leader>mp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" , silent = true }
    )
    keymap.set(
      "n",
      "<leader>ml",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Toggle harpoon menu" , silent = true }
    )
  end,
}
