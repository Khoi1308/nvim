return {
    "catppuccin/nvim", 
    lazy = false, 
    name = "catppuccin", 
    priority = 1000,
    opts = {},

    config = function()
        -- require("catppuccin").setup()
        vim.cmd.colorscheme "catppuccin"
    end
}
