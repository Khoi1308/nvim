vim.g.mapleader = " "

local keymap = vim.keymap

-- Modify window
keymap.set("n", "<leader>wsv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wsh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wx", "<c-w>q", { desc = "Quit current window" })
-- Move window
keymap.set("n", "<leader>wl", "<c-w>l", { desc = "Move right window" })
keymap.set("n", "<leader>wh", "<c-w>h", { desc = "Move left window" })
keymap.set("n", "<leader>wj", "<c-w>j", { desc = "Move down window" })
keymap.set("n", "<leader>wk", "<c-w>k", { desc = "Move up window" })

keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Remove highlight search" })
-- Modify tab
keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Create tab" })
keymap.set("n", "<leader>ts", ":tabs<CR>", { desc = "Show all tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>th", ":tabNext<CR>", { desc = "Move previous tab" })
keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Move next tab" })

keymap.set("v", "<", "<gv", { desc = "Indent left to visual mode"})
keymap.set("v", ">", ">gv", { desc = "Indent right to visual mode"})
