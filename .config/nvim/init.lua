local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('config.lazy')
require('plugins.lsp')
require('plugins.easymotion')
require('plugins.sneak')
require('plugins.gitgutter')
require('plugins.completion')
require('plugins.smoothcursor')
require('plugins.airline')
require('plugins.airline_theme')
require('plugins.fugitive')
require('plugins.copilot')
require('plugins.tagbar')
require('plugins.jumpcursor')
require('plugins.fzf')
require('plugins.tree')
require('plugins.toggleterm')
require('plugins.diffview')
require('options')
require('autocmd')
require('keymaps')
