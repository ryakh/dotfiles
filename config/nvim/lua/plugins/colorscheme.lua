-- What it says on the tin
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    theme = require("kanagawa")

    -- Visual apprance
    vim.opt.termguicolors = true

    theme.load("wave")
  end
}
