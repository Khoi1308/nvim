return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	-- Provides Language specific completion suggestions to nvim-cmp
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- Provide auto completion and auto completion dropdown UI
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Buffer based completion options
			"hrsh7th/cmp-buffer",
			-- Path based completion options
			"hrsh7th/cmp-path",
		},
		config = function()
			-- Gain access to the functions of the cmp plugin
			local cmp = require("cmp")
			-- Gain access to the functions of the luasnip plugin
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					-- Menu: display options in the menu
					-- Menuone: automatically select the first option of the menu
					-- preview: automatically display the completion candidate as you navigate the menu
					-- noselect: prevent neovim from automatically selecting a completion option while navigating the menu
					competeopt = "menu, menuone, preview, noselect",
				},
				-- Setup snippet support based on the active lsp and the current text of the file
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				-- Setup how we interact with completion menus and options
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- Show completion suggestions
					["<C-Space>"] = cmp.mapping.complete(),
					-- Close completion window
					["<C-e>"] = cmp.mapping.abort(),
					-- Confirm completion, only when you explicitly selected an option
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
