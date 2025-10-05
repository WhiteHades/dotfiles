-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

-- if tmux session
if os.getenv("TMUX") then
  map.del("n", "<C-h>")
  map.del("n", "<C-j>")
  map.del("n", "<C-k>")
  map.del("n", "<C-l>")
  map.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end

map.set("i", "jj", "<Esc>", { silent = true })
map.set("i", "jk", "<Esc>", { silent = true })
