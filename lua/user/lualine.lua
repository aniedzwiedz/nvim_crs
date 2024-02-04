local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
    "nvim-tree/nvim-web-devicons", -- fancy icons
    "linrongbin16/lsp-progress.nvim", -- LSP loading progress
  },
}

function M.config()
  -- local icons = require "user.icons"

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = false, -- Show diagnostics even if there are none.
  }

  local filetype = {
    function()
      local filetype = vim.bo.filetype
      local upper_case_filetypes = {
        "json",
        "jsonc",
        "yaml",
        "toml",
        "css",
        "scss",
        "html",
        "xml",
      }

      if vim.tbl_contains(upper_case_filetypes, filetype) then
        return filetype:upper()
      end

      return filetype
    end,
  }

  -- local icons = require "user.icons"

  require("lualine").setup {
    options = {
      theme = auto,
      disabled_filetypes = { -- Filetypes to disable lualine for.
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "starter" },
          winbar = {},
        },
      },
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { { "branch", icon = "" } },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      -- lualine_a = { "mode" },
      -- lualine_a = {},
      -- lualine_a = { "FugitiveHead" },

      -- lualine_b = { { "FugitiveHead", icon = { "", align = "right" } } },
      -- lualine_c = { diagnostics },
      -- lualine_c = { diff },
      lualine_b = {
        {
          "diff",
          symbols = {
            -- added = icons.git.LineAdded,
            -- modified = icons.git.LineModified,
            -- removed = icons.git.LineRemoved,
          },
        },
      },
      lualine_c = { "filename" },

      -- lualine_x = { diff, "copilot", filetype },
      lualine_x = {
        -- "copilot",
        diagnostics,
        { "filetype", separator = " ", padding = { left = 1, right = 0 } },
      },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    -- extensions = { "quickfix", "man", "fugitive", "oil" },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
