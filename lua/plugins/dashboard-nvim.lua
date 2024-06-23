-- https://github.com/nvimdev/dashboard-nvim

local cmd = "node -e \"console.log(require('${HOME}/.config/nvim/scripts/yiji.js').getTodayYiJi())\""
local handle = io.popen(cmd)
local yi = nil
if handle then
  local result = handle:read("*a")
  yi = "宜: " .. string.match(result, "yi: '(.*)',") .. " 忌: " .. string.match(result, "ji: '(.*)'")
end

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
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = "󱎸 ",
            icon_hl = "@variable",
            desc = "Words",
            group = "Label",
            action = "Telescope live_grep",
            key = "w",
          },
          {
            icon = "󰈆 ",
            icon_hl = "@variable",
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
