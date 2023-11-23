return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets", -- useful snippets
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	opts = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10 },
				{ name = "luasnip" },
				{ name = "path" },
				{ { name = "buffer" } },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			sorting = defaults.sorting,
		}
	end,
	config = function(_, opts)
		require("cmp").setup(opts)
	end,
}
-- return {
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   dependencies = {
--     "hrsh7th/cmp-buffer",         -- source for text in buffer
--     "hrsh7th/cmp-path",           -- source for file system paths
--     "L3MON4D3/LuaSnip",           -- snippet engine
--     "saadparwaiz1/cmp_luasnip",   -- for autocompletion
--     "rafamadriz/friendly-snippets", -- useful snippets
--     "onsails/lspkind.nvim",       -- vs-code like pictograms
--   },
--   config = function()
--     local cmp = require("cmp")
--
--     local luasnip = require("luasnip")
--
--     local lspkind = require("lspkind")
--
--     -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
--     require("luasnip.loaders.from_vscode").lazy_load()
--
--     cmp.setup({
--       -- turn off suggestions for specific file types
--       enabled = function()
--         local disabled_filetypes = { "markdown" }
--         for _, filetype in ipairs(disabled_filetypes) do
--           if filetype == vim.bo.filetype then
--             return false
--           end
--         end
--         return true
--       end,
--       completion = {
--         completeopt = "menu,menuone,preview,noselect",
--       },
--       snippet = { -- configure how nvim-cmp interacts with snippet engine
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--         ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--         ["<C-e>"] = cmp.mapping.abort(),    -- close completion window
--         ["<CR>"] = cmp.mapping.confirm({ select = false }),
--       }),
--       -- sources for autocompletion
--       sources = cmp.config.sources({
--         { name = "nvim_lsp", priority = 10 },
--         { name = "luasnip" }, -- snippets
--         { name = "buffer" }, -- text within current buffer
--         { name = "path" }, -- file system paths
--       }),
--       -- configure lspkind for vs-code like pictograms in completion menu
--       formatting = {
--         format = lspkind.cmp_format({
--           maxwidth = 50,
--           ellipsis_char = "...",
--         }),
--       },
--     })
--   end,
-- }
