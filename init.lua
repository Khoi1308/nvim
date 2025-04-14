if vim.g.neovide then
  vim.o.guifont = "DejaVuSansM Nerd Font Mono:h14"
end

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

require("configs.options")
require("configs.keymaps")
-- Package management
require("lazy").setup("plugins")
