return {
  {
    "nvim-mini/mini.notify",
    version = "*",
    opts = {},
    keys = {
      { "<leader>n", function() MiniNotify.show_history() end, desc = "Notification History", },
    },
  },
}
