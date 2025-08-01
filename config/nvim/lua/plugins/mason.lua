-- LSP server manager
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Enable mason
    mason.setup()

    mason_lspconfig.setup({
      -- List of servers for mason to install
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "graphql",
        "html",
        "tailwindcss",
        "ts_ls",
        "yamlls",
        "lua_ls",
      },

      -- Auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
  end
}
