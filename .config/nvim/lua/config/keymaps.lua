-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i" }, "jj", "<esc>")
vim.keymap.set({ "i" }, "jk", "<esc>")
vim.keymap.set({ "n" }, "|", ":vsplit<CR>")
vim.keymap.set({ "n" }, "<leader>;", ":Dashboard<CR>")
