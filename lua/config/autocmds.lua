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

function PythonExecuteSelection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  local code = table.concat(lines, "\n")
  vim.api.nvim_exec("python << EOF\n" .. code .. "\nEOF", false)
end

local function executePython()
  vim.api.nvim_set_keymap("v", "<M-Enter>", ":lua PythonExecuteSelection()<CR>", { noremap = true, silent = true })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "py",
  callback = executePython,
})
