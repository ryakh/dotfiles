-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Save current buffer
vim.keymap.set("n", "<C-q>", "<esc>:w<CR>")
vim.keymap.set("i", "<C-q>", "<esc>:w<CR>")

-- Working with tabs
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<Leader>tw", ":tab split<CR>")
for i = 1, 9 do
  vim.keymap.set('n', '<Leader>t' .. i, i .. 'gt', { desc = 'Go to tab ' .. i })
end

-- Close current buffer
vim.keymap.set("n", "<Leader><Leader>", ":bd<CR>")
