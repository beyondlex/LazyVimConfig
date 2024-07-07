-- return {}
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "catppuccin/nvim" },
  after = "catppuccin/nvim",
  -- opts = {
  --   theme = "dracula",
  --   -- theme = "ayu_dark",
  -- },
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 1, {
      function()
        return "🐠⚬∘˚"
        -- return "˚∘⚬🐠"
      end,
      -- color = { fg = 204 },
      -- cond = function()
      --   return true
      -- end,
    })

    local latte = require("catppuccin.palettes").get_palette "latte"

    local o = {
      options = {
        -- theme = "auto",
        theme = "catppuccin",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = {
          {
            "mode",
            color = { fg = latte.text, bg = latte.surface2 }
          }
        },
        lualine_b = {
          {
            "branch",
            color = { fg = latte.text, bg = latte.surface2 }
          }
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 },
            color = { fg = latte.text, bg = latte.surface2 }
          },
          { "location", padding = { left = 0, right = 1 },
            color = { fg = latte.text, bg = latte.surface2 }
          },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%R")
            end,
            color = { fg = latte.text, bg = latte.surface2 }
          },
        },
      },
    }
    return vim.tbl_deep_extend("force", {}, opts, o)
  end,
}
