-- Generate permanent link to a line of code
return {
  "ruifm/gitlinker.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("gitlinker").setup({
      mappings = "<Leader>gl"
    })
  end
}
