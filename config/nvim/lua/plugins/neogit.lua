-- Better git management and integration
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", -- Diff integration
  },
  config = function()
    local neogit = require("neogit")

    neogit.setup({
      disable_line_numbers = false,
    })

    vim.keymap.set("n", "<Leader>g", "<cmd>Neogit<cr>")
  end
}
