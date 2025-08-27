return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "lua",
          "make",
          "python",
          "sxhkdrc",
          "typst",
          "vim",
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
      -- Textobject selection (operator-pending and visual mode)
      { "af", mode = { "x", "o" }, desc = "Select around function" },
      { "if", mode = { "x", "o" }, desc = "Select inner part of function" },
      { "ac", mode = { "x", "o" }, desc = "Select around class" },
      { "ic", mode = { "x", "o" }, desc = "Select inner part of class" },
      { "aa", mode = { "x", "o" }, desc = "Select around parameter" },
      { "ia", mode = { "x", "o" }, desc = "Select inner part of parameter" },

      -- Textobject movement (normal mode)
      { "]f", desc = "Go to next function start" },
      { "[f", desc = "Go to previous function start" },
      { "]c", desc = "Go to next class start" },
      { "[c", desc = "Go to previous class start" },
      { "]a", desc = "Go to next parameter start" },
      { "[a", desc = "Go to previous parameter start" },
      { "]F", desc = "Go to next function end" },
      { "[F", desc = "Go to previous function end" },
      { "]C", desc = "Go to next class end" },
      { "[C", desc = "Go to previous class end" },
      { "]A", desc = "Go to next parameter end" },
      { "[A", desc = "Go to previous parameter end" },
    },

    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- Functions
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- Classes
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              -- Parameters
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            goto_next_start = {
              ["]a"] = "@parameter.outer",
              ["]c"] = "@class.outer",
              ["]f"] = "@function.outer",
            },
            goto_next_end = {
              ["]A"] = "@parameter.outer",
              ["]C"] = "@class.outer",
              ["]F"] = "@function.outer",
            },
            goto_previous_start = {
              ["[a"] = "@parameter.outer",
              ["[c"] = "@class.outer",
              ["[f"] = "@function.outer",
            },
            goto_previous_end = {
              ["[A"] = "@parameter.outer",
              ["[C"] = "@class.outer",
              ["[F"] = "@function.outer",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    keys = {
      {
        "gco",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        mode = "n",
        desc = "go to context",
      },
    },
  },
}
