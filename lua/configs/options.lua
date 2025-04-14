vim.opt.number = true

-- Tab spacing/behavior
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.shiftwidth = 2     -- Number of spaces inserted for each indentation level
vim.opt.softtabstop = 2    -- Number of spaces inserted for tab character
vim.opt.tabstop = 2        -- Rumber of spaces inserted for <Tab> key
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.breakindent = true -- Enable line breaking indentation

-- General behaviors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 100  -- set faster completion
-- vim.opt.writebackup = false -- Prevent editing of files being edited elsewhere
vim.opt.cursorline = true -- Highlight current line

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- Searching behavious
vim.opt.hlsearch = true -- Highlight all matches in search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Match case if explicily contains uppercase letters
