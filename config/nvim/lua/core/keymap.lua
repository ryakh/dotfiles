-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Save current buffer
vim.keymap.set("n", "<C-q>", "<esc>:w<CR>")
vim.keymap.set("i", "<C-q>", "<esc>:w<CR>")

-- Opening new tabs
vim.keymap.set("n", "<C-t>", "<esc>:tabnew<CR>")
vim.keymap.set("i", "<C-t>", "<esc>:tabnew<CR>")

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Close current buffer
vim.keymap.set("n", "<Leader><Leader>", ":bd<CR>")
