-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- vim.lsp.set_log_level("debug")
--

local function set_lua_keymaps()
  local modes = { "n", "v" }
  for _, mode in ipairs(modes) do
    -- send lua script in current buffer to lua, and run
    vim.api.nvim_buf_set_keymap(0, mode, "<M-Enter>", ":w !lua<CR>", { noremap = true, silent = true })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = set_lua_keymaps,
})


-- https://github.com/ray-x/go.nvim
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- set filetype of adoc to asciidoctor instead of asciidoc
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = {"*.adoc", "*.asciidoc"},
--   callback = function()
--     vim.cmd("set filetype=asciidoctor")
--   end,
-- })
--

-- https://www.in2deep.xyz/posts/astro-development-using-nvim/
-- .mdx
vim.filetype.add({
  extension = {
    mdx = "markdown",
    astro = "astro",
  },
  filename = {},
  pattern = {},
})
-- https://joschua.io/posts/2023/06/22/set-up-nvim-for-astro/
-- vim.treesitter.language.register("markdown", "mdx")
