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
      rules = {
        default = {
          description = "Collection of common files for all projects",
          files = {
            ".clinerules",
            ".cursorrules",
            ".goosehints",
            ".rules",
            ".windsurfrules",
            ".github/copilot-instructions.md",
            "AGENT.md",
            "AGENTS.md",
            { path = "CLAUDE.md",           parser = "claude", },
            { path = "CLAUDE.local.md",     parser = "claude", },
            { path = "~/.claude/CLAUDE.md", parser = "claude", },
          },
        },
      },
      prompt_library = {
        markdown = {
          dirs = {
            vim.fn.getcwd() .. "/.prompts",
            "~/.config/nvim/prompts",
          },
        },
      },
      display = {
        diff = {
          enabled = true,
          provider = "mini_diff",
        },
        chat = {
          window = {
            width = 0.3,
          },
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = "mistral",
            model = "devstral-2512",
          },
          opts = {
            completion_provider = "blink",
          },
        },
        inline = {
          adapter = {
            name = "mistral",
            model = "devstral-2512",
          },
        },
        cmd = {
          adapter = {
            name = "mistral",
            model = "devstral-2512",
          },
        },
        background = {
          adapter = {
            name = "mistral",
            model = "labs-devstral-small-2512",
          },
        },

      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
