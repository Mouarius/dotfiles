return {
	"numToStr/Comment.nvim",
	opts = {},
	lazy = false,
	config = function(_, opts)
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
