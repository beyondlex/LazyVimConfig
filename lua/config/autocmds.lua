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
