local options = {
  breakindent = true,
  cmdheight = 1,
  confirm = true,
  cursorline = true,
  clipboard = "unnamedplus",
  expandtab = true,
  hidden = true,
  lazyredraw = true,
  linebreak = true,
  number = true,
  numberwidth = 1,
  pumheight = 20,
  relativenumber = true,
  scrolloff = 4,
  shiftwidth = 2,
  shortmess = 'aoOstTWAIcCqFS',
  showcmd = false,
  showmode = false,
  sidescrolloff = 4,
  smarttab = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undofile = true,
  whichwrap = "l,h,<,>,[,]",
  wrap = false,
  writebackup = false,
  signcolumn = "yes",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.g.mapleader = " "
