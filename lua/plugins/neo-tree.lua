return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})

		-- Keymap
		vim.keymap.set("n", "<leader>op", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>xp", ":Neotree close<CR>", {})
	end,
}
