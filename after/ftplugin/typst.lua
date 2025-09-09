vim.b.minisurround_config = {
  custom_surroundings = {
    m = {
      input = { "%$().-()%$" },
      output = { left = "$", right = "$" },
    },
    M = {
      input = { "%$().-()%$" },
      output = { left = "$ ", right = " $" },
    },
  },
}

require("mini.pairs").map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
require("mini.pairs").map_buf(0, "i", "_", { action = "closeopen", pair = "__" })
require("mini.pairs").map_buf(0, "i", "*", { action = "closeopen", pair = "**" })
