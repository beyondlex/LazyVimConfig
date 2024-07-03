
return {
  "backdround/global-note.nvim",
  keys = {
    {
      "<leader>nn",
      function()
        require("global-note").toggle_note()
      end,
      desc = "GlobalNote",
    },
    {
      "<leader>nw",
      function()
        require("global-note").toggle_note("work")
      end,
      desc = "WorkNote",
    },
  },
  opts = function(_, opts)
    local o = {
      filename = "global-note.adoc",
      directory = os.getenv("HOME") .. "/notes",

      additional_presets = {
        work = {
          filename = "work-note.adoc",
          title = "Work Note",
          command_name = "WorkNote",
        }
      }
    }

    return vim.tbl_deep_extend("force", {}, opts, o)
  end,
}
