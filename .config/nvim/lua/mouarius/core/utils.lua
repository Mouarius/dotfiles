local M = {}

M.load_mappings = function (mappings)
  for mode, values in pairs(mappings) do
    for keybind, mapping_info in pairs(values) do
      local action = mapping_info[1]
      local desc = mapping_info[2]
      vim.keymap.set(mode, keybind, action, {desc=desc})
    end
  end
end

return M
