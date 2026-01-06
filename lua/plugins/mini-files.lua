return {
  "nvim-mini/mini.files",
  version = "*",
  keys = {
    { "<leader>O", function() MiniFiles.open() end, desc = "Open file explorer", },
  },
  opts = {
    mappings = {
      go_in = "L",
      go_in_plus = "l",
      go_out = "H",
      go_out_plus = "h",
    },
  },
}
