-- Floating window with terminal to run external programs in
return {
  "voldikss/vim-floaterm",
  init = function()
    vim.g.floaterm_width = 0.95
    vim.g.floaterm_height = 0.95
  end,
  config = function()
    vim.keymap.set("n", "<leader>rs", "<cmd>FloatermNew bundle exec rspec %<cr>")
    vim.keymap.set("n", "<leader>rt", "<cmd>FloatermNew bundle exec rails test<cr>")
    vim.keymap.set("n", "<leader>rb", "<cmd>FloatermNew bundle exec rubocop<cr>")
  end
}
