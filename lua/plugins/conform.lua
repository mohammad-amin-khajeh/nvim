return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Set default options
    notify_on_error = false,
    default_format_opts = {
      timeout_ms = 500,
      async = true,
      quiet = false,
      lsp_format = "fallback",
    },

    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
      sh = { "shfmt", "shellcheck" },
      zsh = { "shfmt", "shellcheck" },
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },

    -- Set up format-on-save
    format_on_save = {},

    -- Customize formatters
    formatters = {
      shfmt = {
        append_args = { "-i", "2", "-bn", "-sr" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
