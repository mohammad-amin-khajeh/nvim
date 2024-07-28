local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    c = { "clang-format" },
    css = { "biome" },
    html = { "biome" },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    python = { "ruff" },
    sh = { "shellharden", "shfmt" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    zsh = { "shellharden", "shfmt" },
  },

  --[[ format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  }, ]]
}

require("conform").setup(options)
