-- Floating window with terminal to run external programs in
return {
  "voldikss/vim-floaterm",
  init = function()
    vim.g.floaterm_width = 0.95
    vim.g.floaterm_height = 0.95
  end,
  config = function()
    vim.keymap.set("n", "<leader>gg", "<cmd>FloatermNew lazygit<cr>")
    vim.keymap.set("n", "<leader>b", "<cmd>FloatermNew btop<cr>")
  end
}
