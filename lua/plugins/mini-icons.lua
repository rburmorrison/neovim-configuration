return {
  {
    "nvim-mini/mini.icons",
    version = "*",
    config = function()
      require("mini.icons").setup()

      MiniIcons.tweak_lsp_kind()
    end,
  },
}
