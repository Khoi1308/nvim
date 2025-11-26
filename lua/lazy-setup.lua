vim.o.guifont = "DejaVuSansM Nerd Font Mono:h14"

-- Declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Check if not clone lazy-vim, it clone into lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = { { import = "plugins" } }
-- Declare few options for lazy
local opts = {
	change_detection = {
		-- Don't notify us every time a change is made to the configuration
		notify = false,
	},
	checker = {
		-- Automatically check for package updates
		enabled = true,
		-- Don't spam us with notification every time there is an update available
		notify = false,
	},
}

-- Package management
require("lazy").setup(plugins, opts)
