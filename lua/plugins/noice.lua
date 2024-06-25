return {
  "folke/noice.nvim",
  opts = function(_, opts)
    local o = {
      messages = {
        enabled = true,
        view = "notify", -- "split", -- eg: notify
      },
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true,
      },
    }

    return vim.tbl_deep_extend("force", {}, opts, o)
  end,
}
