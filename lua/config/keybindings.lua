-----------------------
-- Movement Bindings --
-----------------------

vim.keymap.set({ "n", "v", }, "gh", "^", { desc = "Go to start of line", })
vim.keymap.set({ "n", "v", }, "gl", "$", { desc = "Go to end of line", })

------------------------------
-- Language Server Bindings --
------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-config", {}),
  callback = function(ctx)
    vim.keymap.set("n", "<leader>lh",
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ctx.buf, }), { bufnr = ctx.buf, }) end,
      { buffer = ctx.buf, desc = "Toggle inlay hints", })

    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = ctx.buf, desc = "Code actions picker", })

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = ctx.buf, desc = "Format buffer", })

    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ctx.buf, desc = "Rename symbol", })

    vim.keymap.set("n", "<leader>lR", function() MiniExtra.pickers.lsp({ scope = "references", }) end,
      { buffer = ctx.buf, desc = "References picker", })

    vim.keymap.set("n", "<leader>li", function() MiniExtra.pickers.lsp({ scope = "implementation", }) end,
      { buffer = ctx.buf, desc = "Implementation picker", })

    vim.keymap.set("n", "<leader>lt", function() MiniExtra.pickers.lsp({ scope = "type_definition", }) end,
      { buffer = ctx.buf, desc = "Type definition picker", })

    vim.keymap.set("n", "<leader>lO", function() MiniExtra.pickers.lsp({ scope = "document_symbol", }) end,
      { buffer = ctx.buf, desc = "Document symbol picker", })

    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help,
      { buffer = ctx.buf, desc = "Signature help", })

    vim.keymap.set("n", "<leader>ld", function() MiniExtra.pickers.diagnostic({ scope = "current", }) end,
      { buffer = ctx.buf, desc = "Document diagnostics picker", })

    vim.keymap.set("n", "<leader>lD", function() MiniExtra.pickers.diagnostic({ scope = "all", }) end,
      { buffer = ctx.buf, desc = "Workspace diagnostics picker", })
  end,
})
