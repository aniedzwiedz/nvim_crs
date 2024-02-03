local M = {
  "folke/trouble.nvim",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>ld"] = { "<cmd>Trouble<cr>", "Diagnostics" },
    ["<leader>lt"] = { "<cmd>TodoTrouble<cr>", "TODO" },
  }

  -- require("trouble").setup {   -- NOTE: configure plugin 
  --   position = "right", -- position of the list can be: bottom, top, left, right
  --   height = 10, -- height of the trouble list when position is top or bottom
  --   width = 50, -- width of the list when position is left or right
  --   icons = true, -- use devicons for filenames
  -- }
end

return M
