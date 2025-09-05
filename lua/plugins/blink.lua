return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = "rafamadriz/friendly-snippets",
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-c>"] = { "show", "show_documentation", "hide_documentation" },
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 100 },

      accept = { auto_brackets = { enabled = true } },

      menu = {
        auto_show = false,
        draw = { treesitter = { "lsp" } },
      },
    },

    appearance = { nerd_font_variant = "normal" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = { enabled = false },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
