-- general options

vim.o.foldenable = true -- enable fold
vim.o.foldlevel = 99 -- start editing with all folds opened
vim.o.foldmethod = "expr" -- use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.termguicolors = true -- enable rgb colors

vim.o.cursorline = true -- enable cursor line
vim.o.number = true -- enable line number
vim.o.relativenumber = true -- and relative line number
vim.o.signcolumn = "yes" -- always show sign column
vim.o.fillchars = "eob: " -- disable end of buffer tildes

vim.o.pumheight = 10 -- max height of completion menu

vim.opt.diffopt:append("linematch:60") -- second stage diff to align lines

vim.o.confirm = true -- show dialog for unsaved file(s) before quit
vim.o.swapfile = false -- disable swap file
vim.o.backup = false -- don't create backups
vim.o.writebackup = false -- don't create backups before writing
vim.o.undofile = true -- enable persistent undo
vim.o.undolevels = 10000 -- 10x more undo levels

vim.o.ignorecase = true -- case-insensitive search
vim.o.smartcase = true -- , until search pattern contains upper case characters
vim.o.smartindent = true -- auto-indenting when starting a new line
vim.o.shiftround = true -- round indent to multiple of 'shiftwidth'
vim.o.tabstop = 2 -- tab width
vim.o.shiftwidth = 0 -- 0 to follow the 'tabstop' value
vim.o.softtabstop = 2 -- soft-tab width
vim.o.expandtab = true -- use spaces instead of tabs

vim.o.winborder = "single" -- have borders around some floating windows
vim.o.showmode = false -- don't show current mode
vim.o.showcmd = false -- don't show current sequence of keys
vim.o.scrolloff = 10 -- always keep at least 10 lines above and below the cursor
vim.o.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)
vim.o.linebreak = true -- don't break words at the end of lines when wrapping
vim.o.showbreak = "󱞽 " -- use this sign to show that a line is wrapped

vim.o.splitbelow = true -- open new horizontal windows on the bottom
vim.o.splitright = true -- open new vertical windows on the right

vim.schedule(function() -- schedule changing clipboard as it can increase start up time
  vim.o.clipboard = "unnamedplus"
end)

vim.o.inccommand = "split" -- show the live result of substitutions in a new buffer
vim.o.laststatus = 3 -- always show bar

-- define <leader> and <localleader> keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
