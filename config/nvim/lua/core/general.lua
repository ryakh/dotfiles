-- Disable mouse
vim.opt.mouse = ""

-- Line numbers & cursor
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- show absolute line number under cursor
vim.opt.cursorline = true

-- Tabs & spaces
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- Use system clipboard as default register
vim.opt.clipboard:append("unnamedplus")

-- Turn off swapfile
vim.opt.swapfile = false

-- Disable line wrapping
vim.opt.wrap = false

-- Set new split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display extra whitespace and tabs
vim.opt.listchars = { nbsp = "¬", tab = "»·", trail = "·" }

-- Hide end-of-buffer characters
vim.opt.fillchars = { eob = " " }

-- Search settings
vim.opt.ignorecase = true

vim.o.background = ""
