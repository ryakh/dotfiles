return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()

    theme = require("kanagawa")

    -- Visual apprance
    vim.opt.termguicolors = true
    vim.opt.signcolumn = "no"

    theme.load("dragon")
  end
}
