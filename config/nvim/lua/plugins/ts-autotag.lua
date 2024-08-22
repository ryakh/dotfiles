-- Use treesitter to autoclose and autorename html tag
return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",

  config = function()
    require('nvim-ts-autotag').setup()
  end
}
