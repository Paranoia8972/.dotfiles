local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins.lazy")
require("settings.init")
require("settings.keymaps")
require("plugins.dashboard")
require("plugins.filemanager")
require("plugins.lsp")
require("plugins.autocompletion")
require("plugins.fzf")
require("plugins.theme")