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

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.ruby_lsp.setup({
      cmd = { "/Users/ruslan/.asdf/shims/ruby-lsp" },
      capabilities = capabilities,
      init_options = {
        formatter = "standard",
        linters = {
          "standard"
        },
      },
    })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "typescriptreact",
      },
    })

    lspconfig.graphql.setup({
      capabilities = capabilities,
      filetypes = {
        "gql",
        "graphql",
        "javascriptreact",
        "svelte",
        "typescriptreact",
      },
    })

    lspconfig.tailwindcss.setup({
      cmd = { "/Users/ruslan/.asdf/shims/tailwindcss-language-server" },
      capabilities = capabilities,
      filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.yamlls.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    vim.keymap.set("n", "<Leader>dr", "<cmd>Telescope lsp_references<cr>") -- show definition, references
    vim.keymap.set("n", "<Leader>ds", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>") -- go to declaration
    vim.keymap.set("n", "<Leader>dd", "<cmd>lua vim.lsp.buf.hover()<cr>") -- show docs
  end
}
