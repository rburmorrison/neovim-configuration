return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    version = "*",
    opts = {
      provider = "openai_fim_compatible",
      provider_options = {
        openai_fim_compatible = {
          model = "mercury-coder",
          end_point = "https://api.inceptionlabs.ai/v1/fim/completions",
          api_key = "INCEPTION_API_KEY",
          stream = true,
        },
      },
      virtualtext = {
        auto_trigger_ft = { "*", },
        auto_trigger_ignore_ft = {
          "minipick",
        },
        keymap = {
          accept = "<C-S-k>",
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
