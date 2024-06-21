-- https://github.com/uga-rosa/translate.nvim?tab=readme-ov-file
return {
  "uga-rosa/translate.nvim",
  config = function()
    -- :h trnaslate
    require("translate").setup({
      default = {
        command = "translate_shell", -- options: google, deepl_free, deepl_pro
        -- output = "split", -- options: split, floating, insert, replace, register
      },
    })
  end,
}
