return {
	{
		"tpope/vim-fugitive",
		-- config = function ()
		--   vim.keymap.set("n", "<leader>gb", ":Gitsigns blame ")
		-- end
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it Preview [H]unk" })
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "[G]it [T]oggle" })
		end,
	},
}
