return {
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
  --   }
  -- },
  {
    "rest-nvim/rest.nvim",
    enabled = false,
    ft = "http",
    -- dependencies = {
    --   {
    --     "vhyrro/luarocks.nvim",
    --     priority = 1000,
    --     config = true,
    --     opts = {
    --       rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    --     }
    --   }
    -- },
    -- opts = {
    --   rocks = {
    --     hererocks = false,
    --   }
    -- },
    config = function(_, opts)
      require("rest-nvim").setup(opts)
    end,
  }
}

-- opts.rocks.hererocks = false
