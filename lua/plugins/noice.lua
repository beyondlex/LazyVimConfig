return {
  "folke/noice.nvim",
  enabled = true,
  opts = function(_, opts)
    local o = {
      messages = {
        enabled = true,
        view = "notify", -- "split", -- eg: notify
        -- view_error = "split",
      },
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true,
      },
      routes = {
        -- :h FILTERS
        -- route echo(kind) msg_show(:h ui-messages) to split view:
        -- { filter = { event = "msg_show", kind = "echo" }, view = "split", },
        -- { filter = { event = "msg_show", kind = "echo" }, view = "mini" },
        { filter = { event = "msg_show", kind = "echo", min_width = 80 }, view = "popup" },
        { filter = { event = "msg_show", min_width = 100 }, view = "cmdline_output" },
      },
    }

    return vim.tbl_deep_extend("force", {}, opts, o)
  end,
}

-- long_message_to_split = {
--   routes = {
--     {
--       filter = { event = "msg_show", min_height = 20 },
--       view = "cmdline_output",
--     },
--   },
-- },
--
