-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("i", "jk", "<ESC>", { desc = "Escape Normal Mode" })
map("n", "S", "cc", { desc = "Delete lines and start insert" })
map({ "n", "v" }, "j", "j", { silent = true })
map({ "n", "v" }, "k", "k", { silent = true })
map({ "n", "v" }, "d", '"_d', { noremap = true })
