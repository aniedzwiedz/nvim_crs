return
  {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
-- GitLink: generate git link and copy to clipboard.
-- GitLink!: generate git link and open in browser.
-- GitLink blame: generate the /blame url and copy to clipboard.
-- GitLink! blame: generate the /blame url and open in browser.

    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>gy"] = { "<cmd>GitLink<cr>", "Git link" },
        ["<leader>gY"] = { "<cmd>GitLink blame<cr>", "Git link blame" },
      })

      require("gitlinker").setup({
        message = true,
      })
    end,

}
