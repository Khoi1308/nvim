vim.g.mapleader = " "

local keymap = vim.keymap

-- Modify window
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", "<c-w>q", { desc = "Quit current window" })

-- Modify text

-- Hello my name is duong minh anh khoi
