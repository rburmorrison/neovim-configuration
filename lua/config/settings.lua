---------------
-- Aesthetic --
---------------

vim.opt.winborder = "rounded"

----------
-- Tabs --
----------

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-----------------
-- Leader Keys --
-----------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------------------
-- LSP Settings --
------------------

vim.cmd("set completeopt+=menuone,noselect,popup")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-settings", {}),
  callback = function(args)
    ------------------------
    -- Enable Completion --
    ------------------------
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/completion") then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true, })
    end

    if not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("user-lsp-settings", { clear = false, }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000, })
        end,
      })
    end
  end,
})
