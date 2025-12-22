return {
  {
    "nvim-mini/mini.clue",
    version = "*",
    config = function()
      local clue = require("mini.clue")

      clue.setup({
        window = {
          delay = 0,
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<leader>", },
          { mode = "x", keys = "<leader>", },

          -- Built-in completion
          { mode = "i", keys = "<C-x>", },

          -- `g` key
          { mode = "n", keys = "g", },
          { mode = "x", keys = "g", },

          -- Marks
          { mode = "n", keys = "'", },
          { mode = "n", keys = "`", },
          { mode = "x", keys = "'", },
          { mode = "x", keys = "`", },

          -- Registers
          { mode = "n", keys = '"', },
          { mode = "x", keys = '"', },
          { mode = "i", keys = "<C-r>", },
          { mode = "c", keys = "<C-r>", },

          -- Window commands
          { mode = "n", keys = "<C-w>", },

          -- `z` key
          { mode = "n", keys = "z", },
          { mode = "x", keys = "z", },
        },
        clues = {
          { mode = "n", keys = "<leader>l", desc = "+lsp", },
          { mode = "p", keys = "<leader>p", desc = "+codecompanion", },

          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers(),
          clue.gen_clues.windows(),
          clue.gen_clues.z(),
        },
      })
    end,
  },
}
