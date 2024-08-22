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
    { "<Leader>/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<Leader>?", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
