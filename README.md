# Neovim Configuration

## Overview

This is my personal Neovim configuration, tailored for my workflow and preferences.

## Installing

To install, run the following command (HTTPS):

```fish
git clone https://github.com/rburmorrison/neovim-configuration.git ~/.config/nvim
```

Or this one (SSH):

```fish
git clone git@github.com:rburmorrison/neovim-configuration.git ~/.config/nvim
```

## Local AI Configuration

The configuration by default uses Mistral's API for both CodeCompanion and Minuet. You can configure a local model with something like the following examples.

### Minuet

```lua
-- ./lua/plugins/minuet-ai.lua
return {
    "milanglacier/minuet-ai.nvim",
    -- ... normal settings
    opts = {
        provider = "openai_fim_compatible",
        provider_options = {
            api_key = "TERM",
            name = "LMStudio",
            end_point = "http://localhost:1234/v1/completions",
            model = "rnj-1-instruct",
            template = {
                prompt = function(context_before_cursor, context_after_cursor, _)
                    return "<|pre_fim|>" .. context_before_cursor .. "<|suf_fim|>" .. context_after_cursor .. "<|mid_fim|>"
                end,
                suffix = false,
            },
        },
        optional = {
            stop = {
                "<|pre_fim|>",
                "<|suf_fim|>",
                "<|mid_fim|>",
                "<|eoc_fim|>",
            },
        },
    },
}
```

### CodeCompanion

```lua
-- ./lua/plugins/codecompanion.lua
return {
    "olimorris/codecompanion.nvim",
    -- ... normal settings
    opts = {
        adapters = {
            http = {
                lmstudio = function()
                    return require("codecompanion.adapters").extend("opeanai_compatible", {
                        env = {
                            url = "http://localhost:1234",
                        },
                    })
                end,
            },
        },
        interactions = {
            chat = {
                adapter = "lmstudio",
                model = "devstral-small-2-24b-instruct-2512",
                opts = {
                    completion = "blink",
                },
            },
            -- ... and change the adapters for the rest as well
        },
    },
}
```

## Requirements

- Neovim 0.11.5 or later
- Git
- A Nerd Font (recommended for icons)

## Usage

After installation, launch Neovim and let the plugins install automatically.
