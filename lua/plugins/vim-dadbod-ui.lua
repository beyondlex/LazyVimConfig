-- Database Tool
-- https://github.com/kristijanhusak/vim-dadbod-ui
return {
  "kristijanhusak/vim-dadbod-ui",
  enabled = true,
  keys = {
    { "<leader>ll", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" }, desc = "Execute query in visual or normal mode" },
    { "<M-Enter>", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" }, desc = "Execute query in visual or normal mode" },
  },
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
      lazy = true,
      dependencies = {
        -- https://github.com/kristijanhusak/vim-dadbod-completion?tab=readme-ov-file#install
        -- https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#recommended-configuration
        "hrsh7th/nvim-cmp",
        init = function()
          -- https://www.youtube.com/watch?v=ALGBuFLzDSA&ab_channel=TJDeVries
          require("cmp").setup.filetype({ "sql", "mysql" }, {
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          })
        end,
      },
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
