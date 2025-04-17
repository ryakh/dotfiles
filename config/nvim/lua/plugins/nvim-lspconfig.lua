-- LSP stuff
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  init = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.enable("cssls")
    vim.lsp.config("cssls", {
      settings = {
        ["cssls"] = {
          capabilities = capabilities,
        },
      },
    })

    vim.lsp.enable("ruby_lsp")
    vim.lsp.config("ruby_lsp", {
      cmd = { "/Users/ruslan/.asdf/shims/ruby-lsp" },
      settings = {
        ["ruby_lsp"] = {
          capabilities = capabilities,
          init_options = {
            formatter = "standard",
            linters = {
              "standard"
            },
          },
        },
      },
    })

    vim.lsp.enable("emmet_ls")
    vim.lsp.config("emmet_ls", {
      settings = {
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
      }
    })

    vim.lsp.enable("graphql")
    vim.lsp.config("graphql", {
      settings = {
        capabilities = capabilities,
        filetypes = {
          "gql",
          "graphql",
          "javascriptreact",
          "svelte",
          "typescriptreact",
        },
      }
    })

    vim.lsp.enable("tailwindcss")
    vim.lsp.config("tailwindcss", {
      cmd = { "/Users/ruslan/.asdf/shims/tailwindcss-language-server" },
      settings = {
        capabilities = capabilities,
        filetypes = {
          "css",
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      }
    })

    vim.lsp.enable("ts_ls")
    vim.lsp.config("ts_ls", {
      settings = {
        capabilities = capabilities,
      }
    })

    vim.keymap.set("n", "<Leader>dr", "<cmd>Telescope lsp_references<cr>") -- show definition, references
    vim.keymap.set("n", "<Leader>ds", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>") -- go to declaration
    vim.keymap.set("n", "<Leader>dd", "<cmd>lua vim.lsp.buf.hover()<cr>") -- show docs
  end
}
