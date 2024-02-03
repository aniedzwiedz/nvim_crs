local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<F4>", ":DiffviewClose <cr>", desc = "Close Diff View" }, -- closing Diffview
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>gd"] = { "<cmd>DiffviewOpen <cr>", "Open DiffviewOpen" },
  }
end

return M
