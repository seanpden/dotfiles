-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i" }, "jj", "<esc>")
vim.keymap.set({ "i" }, "jk", "<esc>")
vim.keymap.set({ "n" }, "|", ":vsplit<CR>")
vim.keymap.set({ "n" }, "<leader>;", ":Dashboard<CR>")
vim.keymap.set({ "n" }, "<leader>f/", "<cmd>Telescope fzf<cr>", { remap = true })
vim.keymap.set({ "n" }, "<leader>h", ":noh<CR>")
vim.keymap.set({ "n" }, "<leader>w", ":w<CR>", { remap = true })
vim.keymap.set({ "n" }, "<leader>w", ":q<CR>", { remap = true })

LazyVim.toggle.map("<C-w>m", LazyVim.toggle.maximize)
vim.keymap.del("n", "<leader>wm")
