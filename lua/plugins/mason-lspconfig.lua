return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    version = "*",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      -- Lua --
      vim.lsp.enable("lua_ls")

      -- Rust --
      vim.lsp.config("rust_analyzer", {
        on_attach = function(_, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr, })
        end,
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy", },
          },
        },
      })

      -- Python --
      vim.lsp.config("basedpyright", {
        on_attach = function(_, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr, })
        end,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
            },
          },
        },
      })

      -- JSON --
      vim.lsp.enable("jsonls")
    end,
  },
}
