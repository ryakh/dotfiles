-- NVIM wrapper around ripgrep for regex search and replace
return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require('grug-far').setup({})
    vim.keymap.set("n", "<Leader>r", "<cmd>GrugFar<cr>")
  end
}
