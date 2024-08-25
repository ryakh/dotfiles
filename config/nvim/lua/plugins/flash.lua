-- Quick search-navigation on steroids
return {
  "folke/flash.nvim",
  opts = {
    modes = {
      search = {
        enabled = true
      }
    }
  },
  keys = {
    { "<Leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<Leader>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
