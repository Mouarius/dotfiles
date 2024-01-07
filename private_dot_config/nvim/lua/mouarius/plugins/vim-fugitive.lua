return {
  "tpope/vim-fugitive",
  keys = function()
    local toggle_git_blame = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local win = vim.api.nvim_get_current_win()
      if string.match(bufname, "fugitiveblame$") then
        vim.api.nvim_win_close(win, false)
      else
        vim.cmd("Git blame")
      end
    end
    return {
      { "<leader>gs", "<cmd>Git<CR>",   desc = "Git status" },
    }
  end
}
