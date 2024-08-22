-- Display git signs in gutter column
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,

      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },

      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
        delay = 50,
        ignore_whitespace = true,
        virt_text_priority = 100,
      },

      current_line_blame_formatter = "<abbrev_sha> | <author_time:%Y-%m-%d> | <author> | <summary>",

      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    })
  end
}
