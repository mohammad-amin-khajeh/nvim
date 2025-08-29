---@diagnostic disable: duplicate-set-field
local buffer_dir = vim.fn.expand("%:p:h")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config

  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    dashboard = { enabled = true, example = "compact_files" },
    statuscolumn = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    picker = { enabled = true },
    terminal = { enabled = false, shell = "zsh" },

    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },

  -- stylua: ignore start
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart({ layout = 'select' }) end,                   desc = "Smart Find Files" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                              desc = "Command History" },
    { "<leader>,",       function() Snacks.picker.buffers({ layout = 'select' }) end,                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                         desc = "Grep" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                                desc = "Notification History" },
    -- find
    { "<leader>fb",      function() Snacks.picker.buffers({ layout = 'select' }) end,                 desc = "Buffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,      desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files({ layout = 'select' }) end,                   desc = "Find Files" },
    { "<leader>fr",      function() Snacks.picker.recent({ layout = 'select' }) end,                  desc = "Recent" },
    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches({ cwd = buffer_dir }) end,             desc = "Git Branches" },
    { "<leader>gl",      function() Snacks.picker.git_log({ cwd = buffer_dir }) end,                  desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line({ cwd = buffer_dir }) end,             desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status({ cwd = buffer_dir }) end,               desc = "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash({ cwd = buffer_dir }) end,                desc = "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff({ cwd = buffer_dir }) end,                 desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file({ cwd = buffer_dir }) end,             desc = "Git Log File" },
    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                        desc = "Buffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                                 desc = "Grep Open Buffers" },
    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,                                    desc = "Registers" },
    { "<leader>s'",      function() Snacks.picker.marks() end,                                        desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                               desc = "Search History" },
    { "<leader>fD",      function() Snacks.picker.diagnostics() end,                                  desc = "Diagnostics" },
    { "<leader>fd",      function() Snacks.picker.diagnostics_buffer() end,                           desc = "Buffer Diagnostics" },
    { "<leader>h",       function() Snacks.picker.help({ layout = 'select' }) end,                    desc = "Help Pages" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                        desc = "Icons" },
    { "<leader>k",       function() Snacks.picker.keymaps({ layout = 'ivy_split' }) end,              desc = "Keymaps" },
    { "<leader>ma",      function() Snacks.picker.man({ layout = 'select' }) end,                     desc = "Man Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                         desc = "Search for Plugin Spec" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                         desc = "Undo History" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                              desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                             desc = "Goto Declaration" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                          desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                         desc = "Goto T[y]pe Definition" },
    { "<leader>fs",      function() Snacks.picker.lsp_symbols() end,                                  desc = "LSP Symbols" },
    -- Other
    { "<leader>.",       function() Snacks.scratch() end,                                             desc = "Toggle Scratch Buffer" },
    { "<leader>S",       function() Snacks.scratch.select() end,                                      desc = "Select Scratch Buffer" },
    { "<leader>n",       function() Snacks.notifier.show_history() end,                               desc = "Notification History" },
    { "<leader>cR",      function() Snacks.rename.rename_file() end,                                  desc = "Rename File" },
    { "<leader>gg",      function() Snacks.lazygit.open({ cwd = buffer_dir }) end,                    desc = "Lazygit" },
    { "<leader>un",      function() Snacks.notifier.hide() end,                                       desc = "Dismiss All Notifications" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                                 desc = "Switch colorschemes" },
    { "]]",              function() Snacks.words.jump(vim.v.count1) end,                              desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                             desc = "Prev Reference",           mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
  -- stylua: ignore end

  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.diagnostics():map("<leader>ud")
      end,
    })
  end,
}
