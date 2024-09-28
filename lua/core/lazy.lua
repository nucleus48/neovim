local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

require("core.settings")
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    lazy = true,
  },
  install = {
    missing = true,
    colorscheme = { "tokyonight" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require("lazy").setup("plugins", opts)
