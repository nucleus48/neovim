local function map(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", {
    noremap = true,
    silent = true
  }, opts or {})

  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<C-s>", ":w<cr>")
map("n", "<leader>e", ":NvimTreeToggle<cr>")
map("n", "<Tab>", ":bnext<cr>")
map("n", "<S-Tab>", ":bprevious<cr>")
map("n", "<leader>c", ":bdelete<cr>")
