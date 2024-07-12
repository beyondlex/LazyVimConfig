-- https://github.com/nvimdev/dashboard-nvim

local cmd = "node -e \"console.log(require('${HOME}/.config/nvim/scripts/yiji.js').getTodayYiJi())\""
local handle = io.popen(cmd)
local yi = nil
if handle then
  local result = handle:read("*a")
  yi = "宜: " .. string.match(result, "yi: '(.*)',") .. " 忌: " .. string.match(result, "ji: '(.*)'")
end

-- uncited tangerine
-- #FF9408
-- revokable deep turquoise
-- #017374
-- lubric dark teal
-- #014D4E
--
vim.api.nvim_set_hl(0, "lex_a", { fg = "#FF9408" })
vim.api.nvim_set_hl(0, "lex_b", { fg = "#017374" })
vim.api.nvim_set_hl(0, "teal", { fg = "#014D4E" })

-- DashboardHeader
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#989884" })
-- DashboardProjectTitleIcon
vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#4fd6be" })
-- DashboardMruTitle
vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#4fd6be" })

vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#009120" })

-- return {}

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()

    local daysoftheweek =
      { '🌤️Sunday', '🍋Monday', '🍊Tuesday', '🍉Wednesday', '🍎Thursday', '🚗Friday', '🐠Saturday' }
    local day = daysoftheweek[os.date('*t').wday]

    local opts = {
      theme = "hyper",
      shortcut_type = "number",
      hide = {
        statusline = false,
      },
      config = {
        header = {
          '',
          '',
          day or 'Hi',
          '',
          '',
        },
        week_header = {
          enable = false,
          concat = yi or "",
          append = {},
        },
        project = { limit = 3, enable = false, },
        mru = { limit = 5 },
        footer = { '', '', yi },
        shortcut = {
          {
            icon = "󰱼 ",
            -- icon_hl = "@variable",
            desc = "Files",
            group = "DiagnosticInfo",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = "󱎸 ",
            -- icon_hl = "@variable.member",
            -- key_hl = "@variable.member",
            -- desc_hl = "@variable.member",
            desc = "Text",
            group = "Number",
            action = "Telescope live_grep",
            key = "t",
          },
          {
            icon = "󰈆 ",
            -- icon_hl = "@variable",
            desc = "Quit",
            group = "Label",
            action = "qa",
            key = "q",
          },
        },
      },
    }

    return opts
  end,
}
