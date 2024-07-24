require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

--[[ -- some quality of life bindings
map({ "n", "v" }, "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "format files" }) ]]

-- center the screen after going up and down with c-d c-u
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- quit like a normal text editor
map({ "n", "i", "v" }, "<C-q>", "<CMD>qa!<CR>")
map("n", "J", "mzJ`z")

-- center the screen after going to the next/prev search result
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- split bindings
map("n", "<leader>\\", "<CMD>vsp<CR>", { desc = "split vertically" })
map("n", "<leader>-", "<CMD>sp<CR>", { desc = "split horizontally" })

-- go to the first non-whitespace character with 0
map("n", "0", "_")
map("n", "_", "0")
map("n", "-", "0")

-- change pane size
map("n", "<c-s-left>", "<c-w>>", { desc = "pane inscrease width" })
map("n", "<c-s-right>", "<c-w><", { desc = "pane decrease width" })
map("n", "<c-s-up>", "<c-w>+", { desc = "pane inscrease height" })
map("n", "<c-s-down>", "<c-w>-", { desc = "pane decrease height" })

-- change pane focus
map("n", "<c-left>", "<c-w>h", { desc = "pane focus left" })
map("n", "<c-right>", "<c-w>l", { desc = "pane focus right" })
map("n", "<c-up>", "<c-w>k", { desc = "pane focus up" })
map("n", "<c-down>", "<c-w>j", { desc = "pane focus down" })

-- move up and down on the wrapped line
map("n", "<up>", "g<up>")
map("n", "<down>", "g<down>")

-- make file execultable
map("n", "<leader>fx", '<CMD>!chmod +x "%"<CR>', { desc = "make file execultable" })

-- some emacs bindings in insert mode
map("i", "<C-a>", "<ESC>I")
map("i", "<C-v>", "<ESC>pa")

-- save like a normal text editor
map("i", "<C-s>", "<CMD>w<CR>")

-- get out of terminal mode
map("t", "<esc><esc>", "<C-\\><C-n>")

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

nomap("n", "<A-v>") -- disable the vertical term binding
