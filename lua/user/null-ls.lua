local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  require("fzf-lua").setup {
    lsp = {
      -- make lsp requests synchronous so they work with null-ls
      async_or_timeout = 3000,
    },
  }

  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting

  null_ls.setup {
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
      null_ls.builtins.diagnostics.gitlint,
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.diagnostics.jsonlint,

    },
  }
end

return M
