local opt = vim.opt
opt.number = true

-- Tab spacing/behavior
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Number of spaces inserted for each indentation level
opt.softtabstop = 2 -- Number of spaces inserted for tab character
opt.tabstop = 2 -- Rumber of spaces inserted for <Tab> key
opt.ai = true -- Auto indent
opt.smartindent = true -- Enable smart indentation
opt.breakindent = true -- Enable line breaking indentation
opt.path:append({ "**" }) -- Finding files - Search down into subfolder

-- General behaviors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.clipboard = "unnamedplus"
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.mouse = "a"
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 100 -- set faster completion
-- opt.writebackup = false -- Prevent editing of files being edited elsewhere
opt.cursorline = true -- Highlight current line

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})

-- Searching behavious
opt.hlsearch = true -- Highlight all matches in search
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Match case if explicily contains uppercase letters
opt.showcmd = true

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = true
opt.foldlevelstart = 99

opt.signcolumn = "yes"
opt.termguicolors = true
