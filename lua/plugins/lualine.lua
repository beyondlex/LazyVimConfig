-- return {}
return {
  "nvim-lualine/lualine.nvim",
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
    local o = {
      options = {
        -- theme = "auto",
        theme = "catppuccin",
      },
    }
    return vim.tbl_deep_extend("force", {}, opts, o)
  end,
}
