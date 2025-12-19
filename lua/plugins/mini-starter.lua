local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

return {
  {
    "nvim-mini/mini.starter",
    version = "*",
    config = function()
      local ministarter = require("mini.starter")
      ministarter.setup({

        header = vim.trim(header),
        evaluate_single = true,
        items = {
          ministarter.sections.builtin_actions(),
          ministarter.sections.pick(),
          { name = "Lazy",  action = "Lazy",  section = "Management actions", },
          { name = "Mason", action = "Mason", section = "Management actions", },
        },
        footer = "",
      })
    end,
  },
}
