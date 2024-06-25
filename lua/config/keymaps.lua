-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- override lazyvim:
map("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<M-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<M-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- TODO: how to remove keymaps from lazyvim?
-- vim.keymap.del("n", "<leader>e")
map("n", "<leader>e", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "Buffers", remap = true })

-- neo-tree.nvim
map("n", "<leader>`", "<cmd> Neotree toggle <CR>", { desc = "Neotree toggle" })
map("n", "<leader>1", "<cmd> Neotree filesystem reveal<CR>", { desc = "Reveal current file in neotree" })

map("n", "<leader>[", "<C-o>", { desc = "go back" })
map("n", "<leader>]", "<C-i>", { desc = "go forward" })
map("n", "<leader>k", "<C-]>", { desc = "jump" })

-- Command + ]: go forward (command key can not work in iTerm, it's the reserved key of iTerm)
map("n", "<D-]>", "<C-i>", { desc = "go forward" })
map("n", "<D-[>", "<C-o>", { desc = "go back" })

map("n", "<leader>cp", ":let @+=expand('%:p')<CR>", { desc = "copy file path of current buffer" })

-- :set foldmethod=indent
-- :help foldmethod
map("n", "+", "<cmd> foldopen <CR>", { desc = "unfold block" })
map("n", "-", "<cmd> foldclose <CR>", { desc = "fold block" })

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action() <CR>", { desc = "code action" })

map("n", "<leader>pa", "<cmd>echo expand('%:p') <CR>", { desc = "print path of current buffer" })

-- translate
map("n", "<leader>tt", "<cmd>Translate zh <CR>", { desc = "translate into chinese" })
map("n", "<leader>te", "<cmd>Translate en <CR>", { desc = "translate into english" })
map("v", "<leader>tt", "<cmd>Translate zh <CR>", { desc = "translate into chinese" })
map("v", "<leader>te", "<cmd>Translate en <CR>", { desc = "translate into english" })
