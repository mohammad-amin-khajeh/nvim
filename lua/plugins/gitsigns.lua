return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Navigation
      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]h", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Next Git hunk" })

      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[h", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Previous Git hunk" })

      -- Actions
      map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })

      map("v", "<leader>ghs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage selected hunk" })

      map("v", "<leader>ghr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset selected hunk" })

      map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
      map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
      map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

      map("n", "<leader>ghb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Git blame (full)" })

      map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Git diff against index" })

      map("n", "<leader>ghD", function()
        gitsigns.diffthis("~")
      end, { desc = "Git diff against last commit" })

      map("n", "<leader>ghQ", function()
        gitsigns.setqflist("all")
      end, { desc = "Add all hunks to quickfix list" })

      map("n", "<leader>ghq", gitsigns.setqflist, { desc = "Add hunks to quickfix list" })

      -- Toggles
      map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
      map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

      -- Text object
      map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Git hunk text object" })
    end,
  },
}
