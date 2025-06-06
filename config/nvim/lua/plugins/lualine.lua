return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("lualine").setup({
      options = {
        component_separators = {
          left = "󰇙",
          right = "󰇙",
        },
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filetype", "filename"},
        lualine_x = {"lsp_status"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
    })
  end
}
