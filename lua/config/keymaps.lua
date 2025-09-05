local map = vim.keymap.set

-- buffer bindings
map("n", "<a-x>", "<CMD>bd<CR>", { desc = "delete buffer" })
map("n", "<leader>a", "<CMD>b#<CR>", { desc = "switch to alternative file/buffer" })
map("n", "<S-right>", "<CMD>bn<CR>", { desc = "go to next buffer" })
map("n", "<S-left>", "<CMD>bp<CR>", { desc = "go to previous buffer" })

-- quality of life
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("x", ">", ">gv")
map("x", "<", "<gv")
map("i", "<c-a>", "<c-o>0")
map("i", "<c-e>", "<c-o>$")
map("n", "<m-g>", "*")
map("n", "<m-f>", "#")
map({ "n", "x" }, "M", "%")
map({ "n", "x" }, "s", "<nop>")
map({ "n", "x" }, "S", "<nop>")
map("n", "gh", "<nop>")
map("n", "<c-up>", "<c-w>+")
map("n", "<c-down>", "<c-w>-")
map("n", "<c-left>", "3<c-w><")
map("n", "<c-right>", "3<c-w>>")
map("n", "<C-s>", "<CMD>silent update<CR>", { desc = "save file" })

-- lsp
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "lsp rename" })
map("n", "<leader>rr", vim.lsp.buf.references, { desc = "lsp references" })
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp code actions" })

map("n", "<leader>mk", "<cmd>make<CR>", { desc = "run make" })

-- plugin manager bindings
map("n", "<leader>lu", "<CMD>Lazy update<CR>", { desc = "lazy update plugins" })
map("n", "<leader>ls", "<CMD>Lazy sync<CR>", { desc = "lazy sync plugins" })
map("n", "<leader>li", "<CMD>Lazy install<CR>", { desc = "lazy install missing plugins" })
map("n", "<leader>lp", "<CMD>Lazy profile<CR>", { desc = "lazy view profile" })
map("n", "<leader>lx", "<CMD>Lazy clean<CR>", { desc = "lazy clean unneeded plugins" })
map("n", "<leader>ll", "<CMD>Lazy log<CR>", { desc = "lazy view log" })
map("n", "<leader>lh", "<CMD>Lazy home<CR>", { desc = "lazy open" })

-- diagnostics
map("n", "]e", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })

map("n", "[e", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous Error" })

map("n", "]w", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
end, { desc = "Next Warning" })

map("n", "[w", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
end, { desc = "Previous Warning" })

-- more functional escape
map({ "n", "o" }, "<Esc>", function()
  if vim.snippet and vim.snippet.active() then
    vim.snippet.stop()
  else
    vim.cmd("noh|echo")
  end
end, { silent = true })

-- quickfix list
map("n", "<leader>qt", function()
  local qf_open = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.fn.getbufvar(buf, "&buftype") == "quickfix" then
      qf_open = true
      vim.api.nvim_win_close(win, true)
      break
    end
  end
  if not qf_open then
    vim.cmd("copen")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>p", true, false, true), "n", false)
  end
end, { desc = "toggle quickfix list" })

map("n", "<leader>qd", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })

-- drop any tmux-specific keymaps here
if os.getenv("TMUX") then
  map("n", "<leader>lg", function()
    local cwd = vim.fn.expand("%:p:h")
    vim.system({ "tmux", "neww", "-c", cwd, "lazygit" }, { text = true })
  end, { desc = "open lazygit in a new window" })
end
