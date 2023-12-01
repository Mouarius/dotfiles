local env_name = vim.fn.getenv("VIRTUAL_ENV")
local EXPECTED_VIRTUAL_ENV = "/home/mariusmenault/dev/venv/hw"
local file_path = vim.api.nvim_buf_get_name(0)
local is_in_mysite = string.find(file_path, "^/home/mariusmenault/dev/greenday/mysite/") == 1

if env_name == EXPECTED_VIRTUAL_ENV and is_in_mysite then
  
end
