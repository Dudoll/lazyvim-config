-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("i", "<C-f>", "<Right>", { desc = "right" })
map("i", "<C-b>", "<Left>", { desc = "left" })
map("i", "<C-a>", "<Home>", { desc = "home" })
map("i", "<C-e>", "<C-o>$", { desc = "end" })
map("i", "<C-d>", "<Del>", { desc = "end" })
map("i", "<leader>n", "!=", { desc = "!=" })
map("i", "<leader>r", "->", { desc = "->" })

map("n", "H", "^", { desc = "home" })
map("n", "L", "$", { desc = "end" })
map("n", "<C-e>", "%", { desc = "pair" })
map("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<A-m>", function()
  Snacks.explorer({ cwd = LazyVim.root() })
end, { desc = "file explorer" })
