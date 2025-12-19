return {
  {
    "NeogitOrg/neogit",
    version = "*",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-mini/mini.pick",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>G", "<cmd>Neogit<cr>", desc = "Show Neogit UI", },
    },
  },
}
