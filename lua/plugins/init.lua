return {
  "nvim-tree/nvim-web-devicons",
  "b0o/schemastore.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
        repeat_linebreak = false
      }
    }
  },

  {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb", "gcc", "gbc" },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {}
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
      }
    }
  }
}
