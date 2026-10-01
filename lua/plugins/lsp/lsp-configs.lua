return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "clangd", "clangd-format", "codelldb", "ts_ls", "eslint-lsp", "gopls", "jsonls" },
    },

    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "clangd", "jdtls", "gopls" },
      })
    end,
  },
  -- Mason nvim dap utilizes mason to autumatically ensure debug debug adapters you want installed is installed
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "java-debug-adapter", "java-test", "codelldb" },
      })
    end,
  },
  -- Utilizes plugin for configuring the Java language server for us
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require("lspconfig/util")

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            suggest = {
              includeCompletionsForModuleExports = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            suggest = {
              includeCompletionsForModuleExports = true,
            },
          },
        },
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              pcall(vim.cmd, "EslintFixAll")
            end,
          })
        end,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
        lspconfig.jsonls.setup({
          capabilities = capabilities,
          settings = {
            json = { schemas = require("schemastore").json.schemas(), validate = { enable = true }, },
          },
        })
      })

      -- Key map
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over documentation" })
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode goto [D]efinition " })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" }) -- Display code action suggestion for code diagnostics in both normal and visual mode
      vim.keymap.set(
        "n",
        "<leader>cr",
        require("telescope.builtin").lsp_references,
        { desc = "[C]ode goto [R]eferences" }
      )
      vim.keymap.set(
        "n",
        "<leader>ci",
        require("telescope.builtin").lsp_implementations,
        { desc = "[C]ode goto [I]mplementation" }
      )
      vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
      vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode goto [D]eclaration" })

      -- TypeScript specific actions
      vim.keymap.set("n", "<leader>co", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        })
      end, { desc = "[C]ode [O]rganize Imports (TS)" })

      vim.keymap.set("n", "<leader>cM", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.addMissingImports.ts" },
            diagnostics = {},
          },
        })
      end, { desc = "[C]ode Add [M]issing Imports (TS)" })

      vim.keymap.set("n", "<leader>cu", function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        })
      end, { desc = "[C]ode Remove [U]nused (TS)" })

      -- Toggle Inlay Hints
      if vim.lsp.inlay_hint then
        vim.keymap.set("n", "<leader>th", function()
          local current = vim.lsp.inlay_hint.is_enabled()
          vim.lsp.inlay_hint.enable(not current)
          vim.notify("Inlay hints: " .. (not current and "Enabled" or "Disabled"))
        end, { desc = "[T]oggle Inlay [H]ints" })
      end
    end,
  },
}
