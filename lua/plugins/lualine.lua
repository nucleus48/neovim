return {
  'nvim-lualine/lualine.nvim',
  event = "BufEnter",
  opts = {
    options = {
      component_separators = "",
      section_separators = "",
      globalstatus = true,
      theme = "tokyonight"
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'diagnostics' },
      lualine_x = { {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      }, 'filetype', 'fileformat' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    extensions = { 'lazy', 'nvim-tree', 'quickfix', 'mason', 'toggleterm' }
  }
}
