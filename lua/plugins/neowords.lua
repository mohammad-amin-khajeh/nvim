return {
  "backdround/neowords.nvim",
  keys = { "w", "b", "e", "ge" },
  config = function()
    local neowords = require("neowords")
    local p = neowords.pattern_presets

    local subword_hops = neowords.get_word_hops(
      p.snake_case,
      p.camel_case,
      p.upper_case,
      p.hex_color,
      "\\v[[:digit:]]+",
      "\\|\\|+",
      "\\&\\&+"
    )

    vim.keymap.set({ "n", "x" }, "w", subword_hops.forward_start)
    vim.keymap.set({ "n", "x" }, "e", subword_hops.forward_end)
    vim.keymap.set({ "n", "x" }, "b", subword_hops.backward_start)
    vim.keymap.set({ "n", "x" }, "ge", subword_hops.backward_end)
  end,
}
