return {
  "michaelb/sniprun",
  enabled = true,
  branch = "master",
  build = "sh install.sh",
  keys = {
    {
      "<M-Enter>",
      ":'<'>SnipRun<cr>",
      desc = "Snip run",
      mode = { "n", "v" },
    }
  }
  -- config = function()
  --   require("sniprun").setup()
  -- end
}
