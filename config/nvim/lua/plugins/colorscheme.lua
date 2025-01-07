-- What it says on the tin
return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto",
      background = {
        dark = "mocha",
        light = "latte",
      },
      integrations = {
        telescope = true,
        mason = true,
        notify = true,
      },
    })
  end,
  init = function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme "catppuccin"
  end
}
