-- Enable clipboard 
vim.opt.clipboard = "unnamedplus"
vim.o.guifont = "DejaVuSansM Nerd Font Mono Regular:h14" -- Thay h12 bằng kích thước phù hợp (ví dụ: 11, 12, 14)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
require("vim-options")
require("keymaps")
-- Package management
require("lazy").setup("plugins")
