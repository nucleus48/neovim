return {
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
    git = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
    },
  },
}
