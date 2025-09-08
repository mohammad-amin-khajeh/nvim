---@diagnostic disable: undefined-global
return {
  "nvim-mini/mini.nvim",
  event = "VeryLazy",

  config = function()
    require("mini.ai").setup({ n_lines = 1000 })
    require("mini.icons").setup()
    require("mini.jump").setup({ delay = { highlight = 10 ^ 9 } })
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup({ mappings = { toggle = "sj" } })
    require("mini.surround").setup({
      search_method = "cover_or_next",
      n_lines = 1000,
      custom_surroundings = {
        c = {
          output = { left = "{ ", right = " }" },
          input = { "%b{}", "^.().*().$" },
        },
        C = {
          output = { left = "{", right = "}" },
        },
      },
    })

    -- Yank in register full path of entry under cursor
    local yank_path = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify("Cursor is not on valid entry")
      end
      vim.fn.setreg(vim.v.register, path)
    end

    -- Open path with system default handler (useful for non-text files)
    local ui_open = function()
      vim.ui.open(MiniFiles.get_fs_entry().path)
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local b = args.data.buf_id
        vim.keymap.set("n", "gX", ui_open, { buffer = b, desc = "OS open" })
        vim.keymap.set("n", "gy", yank_path, { buffer = b, desc = "Yank path" })
      end,
    })

    require("mini.files").setup({
      mappings = { go_out = "H", go_out_plus = "..", go_in = "<CR>" },
      windows = { preview = true, width_preview = 65 },
      options = { use_as_default_explorer = true },
    })

    local statusline = require("mini.statusline")
    statusline.setup({
      use_icons = true,
      content = {
        active = function()
          local git = MiniStatusline.section_git({ trunc_width = 40 })
          local diff = MiniStatusline.section_diff({ trunc_width = 75 })
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local filename = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location = MiniStatusline.section_location({ trunc_width = 75 })
          local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

          ---@diagnostic disable-next-line: duplicate-set-field
          statusline.section_location = function()
            return "%2l:%-2v %P"
          end

          ---@diagnostic disable-next-line: duplicate-set-field
          statusline.section_diagnostics = function()
            local icons = { Error = "󰅚 ", Hint = "󰌶 ", Info = "󰋽 ", Warn = "󰀪 " }
            local levels = { "Error", "Hint", "Info", "Warn" }
            local parts = {}

            for _, level in ipairs(levels) do
              local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level:upper()] })
              if n > 0 then
                table.insert(parts, icons[level] .. n)
              end
            end

            return table.concat(parts, " ")
          end

          return statusline.combine_groups({
            { hl = "NONE", strings = { git, diff, diagnostics } },
            "%<", -- Mark general truncate point
            { hl = "NONE", strings = { filename } },
            "%=", -- End left alignment
            { hl = "NONE", strings = { fileinfo } },
            { hl = "NONE", strings = { search, location } },
          })
        end,
      },
    })

    require("mini.hipatterns").setup({
      highlighters = {
        bug = { pattern = "BUG", group = "MiniHipatternsFixme" },
        fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
        hack = { pattern = "HACK", group = "MiniHipatternsHack" },
        todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
        note = { pattern = "NOTE", group = "MiniHipatternsNote" },
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
    })

    local miniclue = require("mini.clue")
    miniclue.setup({
      window = {
        delay = 200,
        config = { width = "auto" },
      },

      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- `s` key
        { mode = "n", keys = "s" },
        { mode = "x", keys = "s" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },

        -- `[` and `]` keys
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
      },

      clues = {
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.z(),
      },
    })
  end,

  -- stylua: ignore start
  keys = {
    { "<leader>e", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = "toggle mini files in buffer's directory" },
    { "<leader>E", function() MiniFiles.open() end, desc = "toggle mini files" },
    { "sas", "sa_", desc = "surround whole line", remap = true },
    { "saS", "sa$", desc = "surround till the end of the line", remap = true },
    { "gR", "gr$", desc = "replace till the end of the line", remap = true },
  },
  -- stylua: ignore end
}
