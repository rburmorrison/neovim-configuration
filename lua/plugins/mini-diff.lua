return {
  {
    "nvim-mini/mini.diff",
    version = "*",
    lazy = false,
    keys = {
      { "<leader>O", function() MiniDiff.toggle_overlay() end, desc = "Toggle diff overlay", },
    },
    opts = {},
  },
}
