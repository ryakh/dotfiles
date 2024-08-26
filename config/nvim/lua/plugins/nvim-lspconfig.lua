-- LSP stuff
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local on_attach = function(client, bufnr)
    end

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "javascript" },
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["ruby_lsp"].setup({
      init_options = {
        formatter = "standard",
        linters = { "standard" },
      },
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.keymap.set("n", "<Leader>dr", "<cmd>Telescope lsp_references<cr>") -- show definition, references
    vim.keymap.set("n", "<Leader>ds", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>") -- go to declaration
    vim.keymap.set("n", "<Leader>dd", "<cmd>lua vim.lsp.buf.hover()<cr>") -- show docs
  end
}
