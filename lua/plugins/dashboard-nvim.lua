-- https://github.com/nvimdev/dashboard-nvim

local cmd = "node -e \"console.log(require('${HOME}/.config/nvim/scripts/yiji.js').getTodayYiJi())\""
local handle = io.popen(cmd)
local yi = nil
if handle then
  local result = handle:read("*a")
  yi = "宜: " .. string.match(result, "yi: '(.*)',") .. " 忌: " .. string.match(result, "ji: '(.*)'")
end

-- DashboardHeader
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#FEDF08" })
-- DashboardProjectTitleIcon
vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#4fd6be" })
-- DashboardMruTitle
vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#4fd6be" })

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      shortcut_type = "number",
      config = {
        week_header = {
          enable = true,
          concat = yi or "",
          append = {},
        },
        project = { limit = 4 },
        mru = { limit = 5 },
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
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
