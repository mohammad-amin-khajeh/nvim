return {
  "saghen/blink.cmp",
  event = "InsertEnter",

  -- optional: provides snippets for the snippet source
  dependencies = "rafamadriz/friendly-snippets",

  -- use a release tag to download pre-built binaries
  version = "1.*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

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

    signature = {
      enabled = true,
      trigger = { enabled = false },
    },

    appearance = { nerd_font_variant = "normal" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = { enabled = false },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
