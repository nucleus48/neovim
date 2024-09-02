return {
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
}
