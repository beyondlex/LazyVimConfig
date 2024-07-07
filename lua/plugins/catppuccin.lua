-- https://github.com/catppuccin/nvim
local grey = '#F2F2F2'
local purp = '#EEEBFE'
local light_blue = '#DAEFFF'
local warning = "#FDB147"
local lightgrey = '#dddddd'
local darkgrey = '#222222'
local text = '#000000'
local green = '#DFF6DB'
local dark_green = "#009120"

return {
  { 
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = true,
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
          indent_blankline = {
            enabled = false,
            scope_color = "base",
            colored_indent_levels = false,
          },
        },
        color_overrides = {
          latte = {
            base = "#ffffff",
            surface1 = "#DEE8E2",
            surface2 = grey,
            lavender = darkgrey,
            peach = "#95009A",
            --peach = "#1e66f5",
            mauve = "#209fb5",
            maroon = darkgrey,
            yellow = darkgrey,
            blue = darkgrey,
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
              SignColumn = { fg = warning }, -- column where |signs| are displayed
              SignColumnSB = { bg = C.crust, fg = warning }, -- column where |signs| are displayed
              -- NeoTreeNormal = { fg = latte.text, bg = grey },
              -- NeoTreeNormalNC = { fg = latte.text, bg = grey },
              -- BufferLineFill = { fg = latte.text, bg = grey },
              NeoTreeFileStatsHeader = { fg = latte.mantle, bg = grey },
              NeoTreeWinSeparator = { fg = latte.mantle, bg = "NONE" },
              NeoTreeDirectoryIcon = { fg = lightgrey, bg = "NONE" },
              Comment = { fg = "#E2E2E3"},
              -- popup menu
              PmenuSel = { fg = "#ffffff", bg = "#002D04" },
              Pmenu = { bg = "#D0FEFE" },
              PmenuSbar = { bg = "#90E4C1" }, -- Popup menu: scrollbar.
              PmenuThumb = { bg = "#1FA774" }, -- Popup menu: Thumb of the scrollbar.
              NoiceScrollbar = { bg = "#eeeeee"},
              NoiceScrollbarThumb = { bg = "#dddddd" },


              -- catppuccin-nvim/lua/catppuccin/groups/integrations/native_lsp.lua
              LspReferenceText = { bg = purp },
              LspReferenceRead = { bg = purp },
              LspReferenceWrite = { bg = purp },
              DiagnosticSignWarn = { fg = warning },
              DiagnosticVirtualTextWarn = {
                bg = O.transparent_background and C.none or U.darken(warning, darkening_percentage, C.base),
                fg = warning,
                style = virtual_text.warnings,
              }, -- Used as the mantle highlight group. Other Diagnostic highlights link to this by default
              CursorLine = {
                bg = U.vary_color({ latte = U.lighten(green, 0.70, C.base) }, U.darken(C.surface0, 0.64, C.base)),
              }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
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
              indicator_selected = { fg = dark_green },
              buffer_selected = { style = { "bold", "italic" }},
              -- Modified
              modified = { fg = dark_green, bg = latte.mantle },
              modified_visible = { fg = dark_green, bg = latte.mantle },
              modified_selected = { fg = dark_green, bg = latte.base },
            },
          },
        },
      }
      options = vim.tbl_deep_extend("force", {}, opts, options)
      require("bufferline").setup(options)
    end
  }
}
