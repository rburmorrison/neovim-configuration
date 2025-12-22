return {
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    keys = {
      { "<leader>pi", ":CodeCompanion ",                   desc = "CodeCompanion inline assistant", mode = "v", },
      { "<leader>pa", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion actions",          mode = { "n", "v", }, },
      { "<leader>pe", ":CodeCompanionCmd ",                desc = "CodeCompanion command",          mode = { "n", "v", }, },
      { "<leader>pc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion chat toggle", },
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    opts = {
      prompt_library = {
        markdown = {
          dirs = {
            vim.fn.getcwd() .. "/.prompts",
            "~/.config/nvim/prompts",
          },
        },
      },
      display = {
        chat = {
          window = {
            width = 0.3,
          },
        },
      },
      interactions = {
        chat = {
          adapter = "mistral",
          model = "devstral-2512",
          opts = {
            completion_provider = "default",
          },
        },
        inline = {
          adapter = "mistral",
          model = "devstral-2512",
        },
        cmd = {
          adapter = "mistral",
          model = "devstral-2512",
        },
        background = {
          adapter = "mistral",
          model = "labs-devstral-small-2512",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
