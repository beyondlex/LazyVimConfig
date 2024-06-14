-- symbol outline

return {

  "stevearc/aerial.nvim",
  opts = {
    close_on_select = true,
    backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
    filter_kind = false,
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ol", "<cmd>AerialToggle<CR>", desc = "Toggle Symbol Outline" },
  },
  config = function(_, opts)
    require("aerial").setup(opts)
  end,
}
