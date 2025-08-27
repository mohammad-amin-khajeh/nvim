vim.api.nvim_create_autocmd("textYankpost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 80 })
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = "Auto create dir when saving a file, in case some intermediate directory does not exist",
  group = vim.api.nvim_create_augroup("auto-create-dirs", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Copy the photo from clipboard to the current file's directory
vim.api.nvim_create_user_command("ZolaPic", function()
  local filename = vim.fn.input({ prompt = "enter the filename without an extension: " })
  local cwd = vim.fn.expand("%:p:h")

  os.execute("xclip -sel c -t image/png -o > " .. cwd .. "/" .. filename .. ".png")
end, {})

-- fill in frontmatter boilerplate for pages
vim.api.nvim_create_user_command("ZolaFrontmatter", function()
  local current_date = os.date("%Y-%m-%d")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, {
    "+++",
    'title = ""',
    'description = ""',
    "date = " .. '"' .. current_date .. '"',
    "[extra]",
    "toc = false",
    "[taxonomies]",
    "tags = []",
    "categories = []",
    "+++",
  })
end, {})

vim.api.nvim_create_autocmd({ "BufNewFile", "bufRead" }, {
  desc = "enable sxhkdrc syntax highlighting",
  group = vim.api.nvim_create_augroup("highlighting", { clear = true }),
  pattern = { "*sxhkdrc" },
  callback = function()
    vim.bo.ft = "sxhkdrc"
  end,
})

vim.api.nvim_create_autocmd("User", {
  desc = "lsp-integrated file renaming for mini-files using snacks",
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  desc = "go to last place when opening a buffer",
  group = vim.api.nvim_create_augroup("lastplace", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    elseif mark[1] > lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, { lcount, 0 })
    end
  end,
})
