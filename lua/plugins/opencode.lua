return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      {
        "folke/snacks.nvim",
        opts = {
          input = {},
          terminal = {},
          picker = {},
        },
      },
    },
    config = function()
      vim.o.autoread = true

      vim.g.opencode_opts = {}

      vim.keymap.set({ "n", "v", }, "<leader>pa", function()
        require("opencode").select()
      end, { desc = "Opencode actions", })

      vim.keymap.set({ "n", "t", }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Opencode toggle", })

      vim.keymap.set("v", "<leader>pi", function()
        require("opencode").ask("@this: ", { submit = true, })
      end, { desc = "Opencode inline", })

      vim.keymap.set({ "n", "x", }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Add range to opencode", expr = true, })

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Add line to opencode", expr = true, })
    end,
  },
}
