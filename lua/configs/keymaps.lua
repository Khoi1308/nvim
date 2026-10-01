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

keymap.set("v", "<", "<gv", { desc = "Indent left to visual mode" })
keymap.set("v", ">", ">gv", { desc = "Indent right to visual mode" })

keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Hover errors" })

-- Toggle fold
keymap.set("n", "<Tab>", "za", { desc = "Toggle fold" })
keymap.set("n", "<leader>cH", ":TSBufEnable highlight<CR>", { desc = "[C]ode [H]ighlight" })

-- Chạy nhanh file hiện tại (TS, JS, C++) trong Terminal split
keymap.set("n", "<leader>rc", function()
	local file = vim.fn.expand("%")
	local ext = vim.fn.expand("%:e")
	vim.cmd("write")
	if ext == "ts" or ext == "tsx" then
		vim.cmd("botright split | resize 12 | terminal npx tsx " .. file)
	elseif ext == "js" or ext == "jsx" then
		vim.cmd("botright split | resize 12 | terminal node " .. file)
	elseif ext == "cpp" or ext == "c" then
		local out = vim.fn.expand("%:r")
		local cmd = vim.fn.has("win32") == 1
				and string.format("g++ %s -o %s.exe && .\\%s.exe", file, out, out)
			or string.format("g++ %s -o %s && ./%s", file, out, out)
		vim.cmd("botright split | resize 12 | terminal " .. cmd)
	else
		vim.notify("Chưa có lệnh chạy mặc định cho file ." .. ext, vim.log.levels.WARN)
	end
end, { desc = "[R]un [C]ode in Terminal" })
