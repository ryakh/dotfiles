-- Better way to navigate and search files
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    telescope.load_extension("fzf");

    vim.keymap.set("n", "<Leader>tp", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<Leader>to", "<cmd>Telescope buffers<cr>")
    vim.keymap.set("n", "<Leader>ts", "<cmd>Telescope live_grep<cr>")
    vim.keymap.set("n", "<Leader>tc", "<cmd>Telescope grep_string<cr>")

    vim.keymap.set("n", "<Leader>tg", "<cmd>Telescope git_bcommits<cr>")
  end
}
