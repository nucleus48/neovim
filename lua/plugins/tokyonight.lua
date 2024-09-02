return {
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
}
