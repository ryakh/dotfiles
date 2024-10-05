return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("telescope").load_extension("harpoon")

    vim.keymap.set("n", "<Leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>")
    vim.keymap.set("n", "<Leader>hl", "<cmd>Telescope harpoon marks<CR>")
  end
}
