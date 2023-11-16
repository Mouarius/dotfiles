return {
  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm("Save changes to %q?", "&Yes\n&No\n&Cancel", "Warning")
            if choice == 1 then
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete buffer",
      },
    },
  },
}
