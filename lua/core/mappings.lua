local term_count = 1

local function map(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", {
    noremap = true,
    silent = true
  }, opts or {})

  vim.keymap.set(mode, lhs, rhs, opts)
end

local function new_terminal(direction)
  local Terminal = require('toggleterm.terminal').Terminal
  local term     = Terminal:new({ direction = direction, count = term_count })
  term_count = term_count + 1
  term:toggle()
end


map("n", "<C-s>", ":w<cr>")
map("n", "<leader>e", ":NvimTreeToggle<cr>")
map("n", "<Tab>", ":bnext<cr>")
map("n", "<S-Tab>", ":bprevious<cr>")
map("n", "<leader>c", ":bdelete<cr>")

map("n", "<leader>ts", ":TermSelect<cr>")
map("n", "<leader>tt", ":ToggleTermToggleAll<cr>")
map("n", "<M-v>", function()
  new_terminal("vertical")
end)
map("n", "<M-f>", function()
  new_terminal("float")
end)
map("n", "<M-h>", function()
  new_terminal("horizontal")
end)
