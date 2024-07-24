require("crates").setup({

  lsp = {
    enabled = true,
    on_attach = function(client, bufnr)
      -- the same on_attach function as for your other lsp's
    end,
    actions = true,
    completion = true,
    hover = true,
  },
})

local crates = require("crates")
local opts = { silent = true }

vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = "crates toggle" }, opts)
vim.keymap.set("n", "<leader>cr", crates.reload, { desc = "crates reload" }, opts)

vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "crates show versions_popup" }, opts)
vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "crates show features popup" }, opts)
vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "crates show dependencies popup" }, opts)

vim.keymap.set("n", "<leader>cu", crates.update_crate, { desc = "crates update crate" }, opts)
vim.keymap.set("v", "<leader>cu", crates.update_crates, { desc = "crates update crates" }, opts)
vim.keymap.set("n", "<leader>ca", crates.update_all_crates, { desc = "crates update all crates" }, opts)
vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, { desc = "crates upgrade crate" }, opts)
vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, { desc = "crates upgrade crates" }, opts)
vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, { desc = "crates upgrade all crates" }, opts)

vim.keymap.set(
  "n",
  "<leader>cx",
  crates.expand_plain_crate_to_inline_table,
  { desc = "crates expand plain crate to inline_table" },
  opts
)
vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, { desc = "crates extract crate into table" }, opts)

vim.keymap.set("n", "<leader>cH", crates.open_homepage, { desc = "crates open homepage" }, opts)
vim.keymap.set("n", "<leader>cR", crates.open_repository, { desc = "crates open repository" }, opts)
vim.keymap.set("n", "<leader>cD", crates.open_documentation, { desc = "crates open documentation" }, opts)
vim.keymap.set("n", "<leader>cC", crates.open_crates_io, { desc = "crates open crates io" }, opts)
vim.keymap.set("n", "<leader>cL", crates.open_lib_rs, { desc = "crates open lib rs" }, opts)
