local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    c = { "clang-format" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    lua = { "stylua" },
    python = { "ruff" },
    sh = { "shellharden", "shfmt" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    zsh = { "shellharden", "shfmt" },
  },

  --[[ format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  }, ]]
}

require("conform").setup(options)
