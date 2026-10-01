return {
	"elmcgill/springboot-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-jdtls",
	},
	config = function()
		local springboot_nvim = require("springboot-nvim")

		-- Run the spring boot project in a vim terminal
		vim.keymap.set("n", "<leader>Jr", springboot_nvim.boot_run, { desc = "[J]ava [R]un Spring Boot" })
		-- Open generate class UI to create a class
		vim.keymap.set("n", "<leader>Jc", springboot_nvim.generate_class, { desc = "[J]ava create [C]lass" })
		-- Open generate interface UI to create an interface
		vim.keymap.set("n", "<leader>Ji", springboot_nvim.generate_interface, { desc = "[J]ava create [I]nterface" })
		-- Open generate enum UI to create an enum
		vim.keymap.set("n", "<leader>Je", springboot_nvim.generate_enum, { desc = "[J]ava create [E]num" })

		-- Run the setup function with default configuration
		springboot_nvim.setup({})
	end,
}
