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

if not vim.g.vscode then
    require('plugins.lsp')
    require('plugins.nvim-window-picker')
    require('plugins.noice')
    require('plugins.bufferline')
    require('plugins.lualine')
    require('plugins.nvim-notify')
    require('plugins.jumpcursor')
    require('plugins.gitgutter')
    require('plugins.completion')
    require('plugins.fugitive')
    require('plugins.copilot')
    require('plugins.tagbar')
    require('plugins.neo-tree')
    require('plugins.toggleterm')
    require('plugins.diffview')
    require('plugins.tokyonight')
    require('plugins.telescope')
end

-- require('plugins.nvim-treesitter')
require('options')
require('autocmd')
require('keymaps')
