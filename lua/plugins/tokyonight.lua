return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = { style = "night" },

  init = function()
    vim.cmd.colors("tokyonight")
  end,
}
