-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- neo-tree.nvim
map("n", "<leader>`", "<cmd> Neotree toggle <CR>", { desc = "Neotree toggle" })
map("n", "<leader>1", "<cmd> Neotree <CR>", { desc = "Neotree focus" })

map("n", "<leader>[", "<C-o>", { desc = "go back" })
map("n", "<leader>]", "<C-i>", { desc = "go forward" })
-- Command + ]: go forward (command key can not work in iTerm, it's the reserved key of iTerm)
map("n", "<D-]>", "<C-i>", { desc = "go forward" })
map("n", "<D-[>", "<C-o>", { desc = "go back" })

-- :set foldmethod=indent
-- :help foldmethod
map("n", "+", "<cmd> foldopen <CR>", { desc = "unfold block" })
map("n", "-", "<cmd> foldclose <CR>", { desc = "fold block" })

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action() <CR>", { desc = "code action" })
