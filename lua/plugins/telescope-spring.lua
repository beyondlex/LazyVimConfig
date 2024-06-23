return {
  "zerochae/telescope-spring.nvim",
  enabled = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("spring").setup()
  end,
}
