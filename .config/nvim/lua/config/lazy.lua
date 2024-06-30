-- Ensure lazy.nvim is installed
local ensure_lazy = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/lazy.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', install_path })
        vim.cmd [[packadd lazy.nvim]]
        return true
    end
    return false
end

local lazy_bootstrap = ensure_lazy()

-- lazy.nvim plugin list
require("lazy").setup({
    -- plugin manager
    { 'wbthomason/packer.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/nvim-lsp-installer' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- airline
    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },

    -- color scheme
    { 'cocopon/iceberg.vim' },

    -- fzf-lua
    { 'ibhagwan/fzf-lua' },

    -- nvim-cmp
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "zbirenbaum/copilot-cmp" },
    { "f3fora/cmp-spell" },
    { "uga-rosa/cmp-dictionary" },

    -- commentary
    { 'tpope/vim-commentary' },

    -- highlight
    { 'machakann/vim-highlightedyank' },

    -- surround
    { 'cohama/lexima.vim' },
    { 'machakann/vim-sandwich' },
    { 'tpope/vim-surround' },

    -- textDocument
    { 'vim-jp/vimdoc-ja' },

    -- markdown preview
    { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install' },

    -- copilot
    { 'github/copilot.vim' },
    { "zbirenbaum/copilot.lua" },

    -- smooth cursor
    { 'gen740/SmoothCursor.nvim', config = function() require('smoothcursor').setup() end },

    -- easymotion
    { 'easymotion/vim-easymotion' },

    -- tagbar
    { 'preservim/tagbar' },

    -- gitgutter
    { 'airblade/vim-gitgutter' },

    -- fugitive
    { 'tpope/vim-fugitive' },

    -- nvim-tree
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    }
})


if lazy_bootstrap then
    require('lazy').sync()
end

