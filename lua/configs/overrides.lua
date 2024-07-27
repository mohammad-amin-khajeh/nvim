return {

  treesitter = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "html",
      "htmldjango",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "norg",
      "python",
      "rust",
      "sql",
      "tsx",
      "typescript",
    },

    indent = {
      enable = true,
      disable = {
        "python",
      },
    },
  },

  mason = {
    ensure_installed = {
      "bacon",
      "bacon-ls",
      "bash-language-server",
      "biome",
      "clangd",
      "clangd-format",
      "css-lsp",
      "emmet-language-server",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "pyright",
      "ruff",
      "shellcheck",
      "shellharden",
      "shfmt",
      "stylua",
      "tailwindcss-language-server",
      "typescript-language-server",
    },
  },

  -- git support in nvimtree
  nvimtree = {
    git = {
      enable = true,
    },

    view = {
      side = "left",
      width = 35,
    },

    sync_root_with_cwd = true,

    update_focused_file = {
      update_root = true,
    },

    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
  },
}
