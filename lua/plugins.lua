return {
  "nvim-tree/nvim-web-devicons",
  "onsails/lspkind.nvim",
  "b0o/schemastore.nvim",
  "Issafalcon/lsp-overloads.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      styles = {
        keywords = { italic = false }
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd [[color tokyonight]]
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      highlight = { enable = true },
      incremental_selection = { enable = true }
    },
    config = function(_, opts)
      local configs = require("nvim-treesitter.configs")
      configs.setup(opts)
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          web_devicons = {
            folder = { enable = true },
          },
          glyphs = {
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            }
          },
        },
      },
      update_focused_file = { enable = true },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    event = "BufEnter",
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'filetype', 'fileformat' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      extensions = { 'lazy', 'nvim-tree', 'quickfix' }
    }
  },


  {
    'akinsho/bufferline.nvim',
    event = "BufEnter",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true
          }
        }
      }
    }
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
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = function()
      require "configs.cmp"
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',

      {
        'L3MON4D3/LuaSnip',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
        dependencies = "rafamadriz/friendly-snippets"
      },
    }
  },

  {
    'neovim/nvim-lspconfig',
    event = { "BufNewFile", "BufRead" },
    config = function()
      require "configs.lspconfig"
    end
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
  },

  {
    'stevearc/dressing.nvim',
    lazy = false,
    opts = {},
  }
}
