return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup()

      treesitter.install({
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
      })
    end,
  },
}
