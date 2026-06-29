-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

vim.keymap.set("n", "<M-[>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<M-]>", ":bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Insert new line below" })
vim.keymap.set("n", "<Esc><CR>", "O<Esc>", { desc = "Insert new line above" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(nil, { scope = "line" })
end, { desc = "Show diagnostics under cursor" })
