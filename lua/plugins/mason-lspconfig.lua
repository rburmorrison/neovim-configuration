return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    version = "*",
    config = function()
      --------------------------------
      -- LSP Advanced Configuration --
      --------------------------------

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

      -- TypeScript --
      vim.lsp.config("ts_ls", {
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })

      -----------------
      -- Mason Setup --
      -----------------

      require("mason").setup()

      -- Auto-install formatters and linters
      local registry = require("mason-registry")

      local packages = {
        "shfmt",
        "shellcheck",
        "prettier",
      }

      for _, pkg_name in ipairs(packages) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
            pkg:install()
          end
        end
      end

      -- Auto-install LSPs
      require("mason-lspconfig").setup(
        {
          ensure_installed = {
            -- Fish
            "fish_lsp",
            -- Bash
            "bashls",
            -- Just
            "just",
            -- CSS
            "cssls",
            "html",
            -- TypeScript / JavaScript
            "eslint",
            "ts_ls",
            -- JSON
            "jsonls",
            -- Lua
            "lua_ls",
            -- Markdown
            "marksman",
            -- Python
            "basedpyright",
            "ruff",
            -- Rust
            "rust_analyzer",
            -- TOML
            "taplo",
          },
          automatic_enable = true,
        }
      )
    end,
  },
}
