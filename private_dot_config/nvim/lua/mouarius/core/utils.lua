local M = {}

M.load_mappings = function(mappings)
	for mode, values in pairs(mappings) do
		for keybind, mapping_info in pairs(values) do
			local action = mapping_info[1]
			local desc = mapping_info[2].desc
			vim.keymap.set(mode, keybind, action, { desc = desc })
		end
	end
end

M.get_python_venv = function()
	return os.getenv("VIRTUAL_ENV")
end

M.get_python_executable = function()
	local venv_path = os.getenv("VIRTUAL_ENV")

	if venv_path ~= nil then
		return venv_path .. "/bin/python3"
	end

	return vim.g.python3_host_prog
end

-- Function to check if a directory contains a Django project
M.contains_django_project = function(directory)
	-- Check if manage.py file exists in the directory
	local file = vim.fn.filereadable(directory .. "/manage.py")
	return file == 1
end

-- Function to recursively search for Django project directory
M.find_django_project_directory = function(root_directory)
	local entries = vim.fn.readdir(root_directory)
	for _, entry in ipairs(entries) do
		if entry ~= "." and entry ~= ".." then
			local full_path = root_directory .. "/" .. entry
			if M.contains_django_project(full_path) then
				return full_path
			else
				local found_directory = M.find_django_project_directory(full_path)
				if found_directory then
					return found_directory
				end
			end
		end
	end
	return nil
end

return M
