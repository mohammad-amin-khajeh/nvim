require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- center the screen after going half page up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- quit like a normal text editor
map({ "n", "i", "v" }, "<C-q>", "<CMD>qa!<CR>")

-- append the next line to the current line but don't change cursor position
map("n", "J", "mzJ`z")

-- center the screen after going to the next/prev search result
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- go to the first non-whitespace character with 0
map("n", "0", "_")
map("n", "_", "0")
map("n", "-", "0")

-- change pane size
map("n", "<c-s-left>", "<c-w>>", { desc = "pane inscrease width" })
map("n", "<c-s-right>", "<c-w><", { desc = "pane decrease width" })
map("n", "<c-s-up>", "<c-w>+", { desc = "pane inscrease height" })
map("n", "<c-s-down>", "<c-w>-", { desc = "pane decrease height" })

-- move up and down on the wrapped line
map("n", "<up>", "g<up>")
map("n", "<down>", "g<down>")

-- make current file execultable
map("n", "<leader>fx", '<CMD>!chmod +x "%"<CR>', { desc = "make file execultable" })

-- some emacs bindings in insert mode
map("i", "<C-a>", "<esc>I")
map("i", "<C-e>", "<esc>A")

-- save like a normal text editor
map("i", "<C-s>", "<CMD>w<CR>")

-- get out of terminal mode
map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Terminal mode close" })

-- toggle transparency in nvchad
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "toggle transparency" })

-- remove search highlights
map("n", "<Esc>", "<CMD>noh<CR>", { desc = "general clear highlights" })

-- lazy
map("n", "<leader>lu", "<CMD>Lazy update<CR>", { desc = "lazy update plugins" })
map("n", "<leader>ls", "<CMD>Lazy sync<CR>", { desc = "lazy sync plugins" })
map("n", "<leader>li", "<CMD>Lazy install<CR>", { desc = "lazy install missing plugins" })
map("n", "<leader>lp", "<CMD>Lazy profile<CR>", { desc = "lazy view profile" })
map("n", "<leader>lx", "<CMD>Lazy clean<CR>", { desc = "lazy clean unneeded plugins" })
map("n", "<leader>ll", "<CMD>Lazy log<CR>", { desc = "lazy view log" })
map("n", "<leader>lh", "<CMD>Lazy home<CR>", { desc = "lazy open" })

-- fix race condition
map("n", "<A-v>", "<cmd>Grapple select index=2<cr>", { desc = "grapple select second tag" })
