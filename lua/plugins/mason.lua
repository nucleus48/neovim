return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      handlers = {
        function(server)
          require("lspconfig")[server].setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities()
          }
        end,

        ["jsonls"] = function()
          require("lspconfig").jsonls.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            settings = {
              json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
              },
            },
          }
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                },
              },
            },
          }
        end
      }
    }
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    opts = {},
  }
}
