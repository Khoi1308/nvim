return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffer",
        offsets = {
          filetype = "NvimTree",
          text = "File Explorer",
          hightlight = "Directory",
          separator = true,
        },
      },
    })

    -- Keymap
    vim.keymap.set("n", "<leader>bs", ":ls<CR>", { desc = "Show all buffer" })
    vim.keymap.set("n", "<leader>bx", ":bdelete<CR>", { desc = "Close buffer" })
    vim.keymap.set("n", "<leader>bd", ":BufferLineCloseOthers<CR>", { desc = "[D]elete All [B]uffer" })
    vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Move next buffer" })
    vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Move to [P]ick [B]uffer" })
  end,
}
