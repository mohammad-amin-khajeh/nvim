require "nvchad.options"

-- add yours here

local autocmd = vim.api.nvim_create_autocmd
local g = vim.g
local o = vim.o

-- enable relative line numbers
o.relativenumber = true

-- scroll off value
o.scrolloff = 8

-- disable swap file
o.swapfile = false

-- disable sql mappings(fix the bug)
g.omni_sql_no_default_maps = 1

-- fix css delimiter
autocmd("InsertEnter", {
  pattern = { "*.css", ".html" },
  command = "set iskeyword=@,48-57,_,192-255",
})

-- highlight cursor position
o.cursorlineopt = "both"

-- enabling inlay hints
vim.lsp.inlay_hint.enable()

-- fix cursor turning into a block after leaving neovim
autocmd("VimLeave", {
  command = 'set guicursor= | call chansend(v:stderr, "\x1b[ q")',
})

-- go back to the last position upon opening a file
autocmd("BufWinEnter", {
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"', false)
  end,
})
