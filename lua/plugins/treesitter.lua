return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = { enable = true }
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    require 'nvim-treesitter.install'.compilers = { "zig" }
    require 'nvim-treesitter.install'.prefer_git = false
    configs.setup(opts)
  end
}
