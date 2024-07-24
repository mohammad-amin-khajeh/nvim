local overrides = require "configs.overrides"

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  -- neorg for note-taking
  {
    "nvim-neorg/neorg",
    version = "*",
    ft = "norg",
    dependencies = { "luarocks.nvim" },
    config = function()
      return require "configs.neorg"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { "c", "d", "y" },
    config = true,
  },

  -- lazygit integration
  {
    "kdheepak/lazygit.nvim",
    vim.keymap.set("n", "<leader>lg", "<CMD>LazyGit<CR>", { desc = "lazygit launch " }),
    cmd = "LazyGit",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- silicon to take screenshots
  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    main = "nvim-silicon",
    vim.keymap.set({ "n", "v" }, "<leader>sc", ":Silicon<cr>", { desc = "take a screenshot" }),
    config = function()
      return require "configs.silicon"
    end,
  },

  -- add some other snippets
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip").filetype_extend("htmldjango", { "html" })
      -- require("luasnip").filetype_extend("python", { "django" })
      require("luasnip").filetype_extend("typescriptreact", { "html" })
    end,
  },

  -- comment.nvim is better than default nvim commenting capabilites
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "comment toggle linewise" },
      { "gc", mode = "x", desc = "comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "comment toggle blockwise" },
      { "gb", mode = "x", desc = "comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,

    opts = function()
      require "configs.comment"
    end,
  },

  -- make working with rust crates easier
  {
    "saecki/crates.nvim",
    event = { "BufReadPost Cargo.toml" },
    config = function()
      require "configs.crates"
    end,
  },

  -- rust tools successor
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    -- lazy = false,   -- This plugin is already lazy
    ft = "rust",
  },

  -- nvim dap ui for debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = { "<leader>db", "<leader>dc", "<leader>do", "<leader>di" },
    config = function()
      require "configs.dap"
    end,
  },

  -- undo tree
  {
    "mbbill/undotree",
    keys = { { "<leader>u", ":UndotreeToggle<cr>", desc = "undotree toggle" } },
  },

  -- autosession for session management
  {
    "rmagatti/auto-session",
    config = function()
      require "configs.auto-session"
    end,
    keys = { "<leader>sr", "<leader>sf", "<leader>ss" },
    cmd = { "SessionSave", "SessionRestore" },
  },

  -- Oil.nvim is the best
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Oil open parent directory" }),
    config = function()
      require "configs.oil"
    end,
  },

  -- extend the d/c /i/a motion with treesitter
  {
    "echasnovski/mini.ai",
    keys = { "c", "d", "y", "v" },
    config = function()
      require("mini.ai").setup {
        search_method = "cover_or_next",
      }
    end,
  },

  -- use custom formatters
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },

  -- tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- harpoon replacement that saves cursor position
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Grapple",
    opts = {
      scope = "cwd",
      icons = true,
      status = true,
    },
    keys = {
      { "<leader>a", "<cmd>Grapple tag<cr>", desc = "grapple tag a file" },
      { "<C-e>", "<cmd>Grapple toggle_tags<cr>", desc = "grapple toggle tags menu" },
      { "<A-c>", "<cmd>Grapple select index=1<cr>", desc = "grapple select first tag" },
      { "<A-v>", "<cmd>Grapple select index=2<cr>", desc = "grapple select second tag" },
      { "<A-b>", "<cmd>Grapple select index=3<cr>", desc = "grapple select third tag" },
      { "<A-n>", "<cmd>Grapple select index=4<cr>", desc = "grapple select fourth tag" },
      { "<A-m>", "<cmd>Grapple select index=5<cr>", desc = "grapple select fifth tag" },
    },
  },

  -- improve the f/t motions to work across multiple lines
  {
    "backdround/improved-ft.nvim",
    keys = { "t", "T", "f", "F" },
    config = function()
      require "configs.ft"
    end,
  },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPost",
    config = function()
      require "configs.highlight_colors"
    end,
  },
}
