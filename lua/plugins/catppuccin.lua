-- https://github.com/catppuccin/nvim
local grey = '#F2F2F2'
local purp = '#EEEBFE'
local light_blue = '#DAEFFF'
local warning = "#eeee00"
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require("catppuccin").setup({
        flavour = "latte",
        integrations = {
          noice = true,
          notify = true,
          bufferline = false,
          dashboard = true,
          neotree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          mason = true,
        },
        color_overrides = {
          latte = {
            base = "#ffffff",
            surface1 = "#DEE8E2",
            lavender = "#4c4f69",
            peach = "#1e66f5",
            mauve = "#209fb5",
            maroon = "#4c4f69",
            yellow = "#4c4f69",
            blue = "#4c4f69",
            green = "#009120",
            rosewater = "#c6a0f6",
            flamingo = "#c6a0f6",
            mantle = grey,
            -- lavender = "#95009A",
          },
        },
        highlight_overrides = {

          latte = function (latte)

            local O = require("catppuccin").options
            local C = require("catppuccin.palettes").get_palette("latte")
            local U = require "catppuccin.utils.colors"
            local virtual_text = O.integrations.native_lsp.virtual_text
            local darkening_percentage = 0.095

            return {
              NeoTreeNormal = { fg = latte.text, bg = latte.base },
              NeoTreeNormalNC = { fg = latte.text, bg = "NONE" },
              Visual = { bg = light_blue, style = {} },
              -- NeoTreeNormal = { fg = latte.text, bg = grey },
              -- NeoTreeNormalNC = { fg = latte.text, bg = grey },
              -- BufferLineFill = { fg = latte.text, bg = grey },
              NeoTreeFileStatsHeader = { fg = latte.mantle, bg = grey },
              NeoTreeWinSeparator = { fg = latte.mantle, bg = "NONE" },
              -- Comment = { fg = "#eeeeee"}
              -- catppuccin-nvim/lua/catppuccin/groups/integrations/native_lsp.lua
              LspReferenceText = { bg = purp },
              LspReferenceRead = { bg = purp },
              LspReferenceWrite = { bg = purp },
              DiagnosticVirtualTextWarn = {
                bg = O.transparent_background and C.none or U.darken(warning, darkening_percentage, C.base),
                fg = warning,
                style = virtual_text.warnings,
              }, -- Used as the mantle highlight group. Other Diagnostic highlights link to this by default
            }
          end,
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "catppuccin/nvim" },
    after = "catppuccin/nvim",
    config = function (_, opts)
      local latte = require("catppuccin.palettes").get_palette "latte"
      local options = {
        options = {
          indicator = {
            style = "icon"
          },
          diagnostics = false,
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get {
          styles = { "italic", "bold" },
          custom = {
            all = {
              fill = { bg = "#ffffff" },
            },
            latte = {
              fill = { bg = "#ffffff" },
              background = { fg = latte.text, bg = grey },
              -- separator = { fg = latte.separator_fg, bg = latte.inactive_bg },
              -- buffer_visible = { bg = grey },
              -- close_button = { bg = grey },
              -- numbers = { bg = grey },
              -- diagnostic = { bg = grey },
              -- indicator_selected = { fg = "#ffffff", bg = latte.inactive_bg },
              buffer_selected = { style = { "bold", "italic" }}
            },
          },
        },
      }
      options = vim.tbl_deep_extend("force", {}, opts, options)
      require("bufferline").setup(options)
    end
  }
}
