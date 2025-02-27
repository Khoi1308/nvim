vim.g.mapleader = " "

local keymap = vim.keymap

-- Modify window
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wx", "<c-w>q", { desc = "Quit current window" })
-- Move window
keymap.set("n", "<leader>wl", "<c-w>l", { desc = "Move right window" })
keymap.set("n", "<leader>wh", "<c-w>h", { desc = "Move left window" })
keymap.set("n", "<leader>wj", "<c-w>h", { desc = "Move down window" })
keymap.set("n", "<leader>wk", "<c-w>h", { desc = "Move up window" })
