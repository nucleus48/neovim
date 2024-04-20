return {
  "nvim-tree/nvim-web-devicons",
  "onsails/lspkind.nvim",
  "b0o/schemastore.nvim",
  "Issafalcon/lsp-overloads.nvim",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
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
        indent_markers = { enable = true },
        icons = {
          web_devicons = {
            folder = { enable = true },
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
        lualine_c = { 'diff' },
        lualine_x = { 'searchcount', 'diagnostics' },
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
      indent = { char = "▏" }
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
      'hrsh7th/cmp-cmdline',
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
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    dependencies = "rafamadriz/friendly-snippets"
  },

  {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb", "gcc", "gbc" },
    opts = {}
  }
}
