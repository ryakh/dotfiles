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

    vim.keymap.set("n", "<Leader>p", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<Leader>o", "<cmd>Telescope buffers<cr>")
    vim.keymap.set("n", "<Leader>s", "<cmd>Telescope live_grep<cr>")
    vim.keymap.set("n", "<Leader>c", "<cmd>Telescope grep_string<cr>")
  end
}
