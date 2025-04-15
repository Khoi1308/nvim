return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Lua language
          null_ls.builtins.formatting.stylua,
          -- Set up eslint for JS
          require("none-ls.diagnostics.eslint_d"),
          -- Set up prettier to format languages that are not lua
          null_ls.builtins.formatting.prettier,
          -- Ruby language
          null_ls.builtins.diagnostics.erb_lint,
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.formatting.rubocop,
          -- C plus plus
          null_ls.builtins.formatting.clang_format,
        },
      })

      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
    end,
  },
}
