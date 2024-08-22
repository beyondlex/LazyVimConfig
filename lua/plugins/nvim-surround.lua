-- https://github.com/kylechui/nvim-surround
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      surrounds = {
        ["l"] = { -- visual select some text, then typing: `l
          add = function()
            return { {"**"}, {"**"} } -- for bold text in markdown
          end,
          find = function()
              local config = require("nvim-surround.config")
              return config.get_selection({ char = "**" })
          end,
          delete = "^(%*%*)().-(%*%*)()$",
        }
      },
      keymaps = {
        visual = "`" -- for surrounding visual selected text by `, just need typing: ``
      }
    })
  end
}
