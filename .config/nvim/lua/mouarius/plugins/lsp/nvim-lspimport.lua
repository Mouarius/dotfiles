return {
  "stevanmilic/nvim-lspimport",
  keys = {
    {
      "<leader>i",
      function()
        require("lspimport").import()
      end,
      noremap = true,
    },
  },
}
