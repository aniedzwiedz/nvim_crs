local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.execs = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "astro",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
  "tailwindcss",
  "rust_analyzer",
  "eslint",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>lI"] = { "<cmd>Mason<cr>", "Mason Info" },
  }

  local icons = require "user.icons"

  require("mason").setup {
    ui = {
      border = "rounded",
      icons = {
        package_installed = icons.ui.Check,
        package_pending = "➜",
        package_uninstalled = icons.ui.Close,
      },
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = M.execs,
  }
end

return M
