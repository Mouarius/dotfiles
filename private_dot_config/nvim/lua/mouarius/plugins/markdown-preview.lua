local status, markdownpreview = pcall(require, "markdown")
if not status then
	return
end
print("markdown preview lodaded")
markdownpreview.setup({})
