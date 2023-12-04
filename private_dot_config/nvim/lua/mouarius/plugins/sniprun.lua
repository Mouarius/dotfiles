return {
  "michaelb/sniprun",
  branch = "master",

  build = "sh ./install.sh",
  -- do 'sh install.sh 1' if you want to force compile locally
  -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
  opts = function()
    return {
      selected_interpreters = { "Python3_fifo" },
      repl_enable = { "Python3_fifo" },
      display = {"Terminal"}
    }
  end,
  keys = {
    { "<leader>r", "<Plug>SnipRun gv", silent = true, mode="v", desc = "SnipRun: Run selection" },
    { "<leader>r", "<Plug>SnipRunOperator", silent = true, desc = "SnipRun: Run operator" },
    { "<leader>rr", "<Plug>SnipRun", silent = true, desc = "SnipRun: run current line"}
  }

  -- config = function()
  --   require("sniprun").setup({
  --     selected_interpreters = { "Python3_jupyter" },
  --     repl_enable = { "Python3_jupyter" },
  --     -- your options
  --   })
  -- end,
}
