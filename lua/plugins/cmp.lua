local function config()
  local cmp = require "cmp"

  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = "single",
        winhighlight = ""
      },
      documentation = {
        border = "single",
        winhighlight = ""
      }
    },
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = require('lspkind').cmp_format({
        mode = 'symbol_text',
        maxwidth = 30,
        ellipsis_char = '...',
        show_labelDetails = true,
        preset = "codicons",
        before = function(_, vim_item)
          vim_item.menu = ""
          return vim_item
        end
      })
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  }
end

return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  config = config,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    "onsails/lspkind.nvim",

    {
      'L3MON4D3/LuaSnip',
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      dependencies = "rafamadriz/friendly-snippets"
    },
  }
}