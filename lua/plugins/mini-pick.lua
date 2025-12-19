return {
  {
    "nvim-mini/mini.pick",
    version = "*",
    lazy = false,
    keys = {
      { "<leader>f", function() MiniPick.builtin.files() end,     desc = "Open file picker", },
      { "<leader>b", function() MiniPick.builtin.buffers() end,   desc = "Open buffer picker", },
      { "<leader>g", function() MiniPick.builtin.grep_live() end, desc = "Open live grep", },
      { "<leader>H", function() MiniPick.builtin.help() end,      desc = "Open help picker", },
    },
    config = function()
      require("mini.pick").setup()

      vim.ui.select = MiniPick.ui_select
    end,
  },
}
