---------------
-- Aesthetic --
---------------

vim.opt.winborder = "rounded"
vim.opt.cursorline = true

----------
-- Tabs --
----------

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-----------------
-- Leader Keys --
-----------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--------------
-- WildMenu --
--------------

vim.o.wildmode = "noselect:lastused,full"
vim.o.wildoptions = "pum"

------------------
-- LSP Settings --
------------------

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-settings", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    --------------------
    -- Format on Save --
    --------------------

    if not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("user-lsp-settings", { clear = false, }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000, })
        end,
      })
    end

    -----------------
    -- Diagnostics --
    -----------------

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
    })
  end,
})

--------------
-- Terminal --
--------------

vim.opt.shell = "fish"

vim.api.nvim_create_autocmd("TermClose", {
  callback = function()
    vim.cmd("bdelete")
  end,
})

-------------------
-- Miscellaneous --
-------------------

vim.opt.undofile = true

----------------
-- Treesitter --
----------------

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "gitignore",
    "html",
    "htmldjango",
    "hurl",
    "javascript",
    "json",
    "just",
    "kdl",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "nu",
    "proto",
    "python",
    "regex",
    "rust",
    "scss",
    "sql",
    "toml",
    "typescript",
    "typst",
    "vim",
    "vimdoc",
    "yaml",
  },
  callback = function()
    -- Highlighting
    vim.treesitter.start()

    -- Folding
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldlevel = 99

    -- Indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
