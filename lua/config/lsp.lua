-- :h lsp-config

-- enable configured language servers
-- you can find server configurations from lsp/*.lua files
vim.lsp.enable({
  "bashls",
  "lua_ls",
  "pyright",
  "tinymist",
})

vim.diagnostic.config({
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})
