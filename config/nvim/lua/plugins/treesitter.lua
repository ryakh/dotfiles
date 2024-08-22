-- Parse current file as AST
return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "html",
        "javascript",
        "lua",
        "ruby",
      }
    })
  end
}
