require("neorg").setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.export"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          english = "~/Documents/notes/english",
          code = "~/Documents/code",
        },
        default_workspace = "code",
      },
    },
  },
}
vim.wo.conceallevel = 2
-- vim.wo.concealcursor = 1
vim.wo.foldlevel = 99
