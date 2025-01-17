---@class ChadrcConfig

local M = {}

M.base46 = {

  theme = "one_light",
  theme_toggle = { "one_light", "one_light" },

  hl_override = {
    ["@comment"] = { italic = true, bold = true },
  },
}

M.ui = {
  cmp = {
    style = "flat_light",
  },

  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "                                                                  ",
      "                                                                  ",
      "                                                                  ",
      "                                                                  ",
      "   ███╗   ███╗███╗   ███╗██████╗       ██╗   ██╗██╗███╗   ███╗    ",
      "   ████╗ ████║████╗ ████║██╔══██╗      ██║   ██║██║████╗ ████║    ",
      "   ██╔████╔██║██╔████╔██║██║  ██║█████╗██║   ██║██║██╔████╔██║    ",
      "   ██║╚██╔╝██║██║╚██╔╝██║██║  ██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║    ",
      "   ██║ ╚═╝ ██║██║ ╚═╝ ██║██████╔╝       ╚████╔╝ ██║██║ ╚═╝ ██║    ",
      "   ╚═╝     ╚═╝╚═╝     ╚═╝╚═════╝         ╚═══╝  ╚═╝╚═╝     ╚═╝    ",
      "                                                                  ",
      "                                                                  ",
      "                                                                  ",
      "                                                                  ",
    },
  },
}
return M
