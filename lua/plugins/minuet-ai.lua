return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    version = "*",
    opts = {
      provider = "codestral",
      virtualtext = {
        auto_trigger_ft = { "*", },
        auto_trigger_ignore_ft = { "codecompanion", },
        keymap = {
          accept = "<C-K>",
          accept_line = "<C-k>",
          accept_n_lines = "<C-;>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
    },
  },
}
