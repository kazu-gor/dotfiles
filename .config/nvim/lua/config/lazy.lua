-- -- Ensure lazy.nvim is installed
-- local ensure_lazy = function()
--     local fn = vim.fn
--     local install_path = fn.stdpath('data') .. '/site/pack/packer/start/lazy.nvim'
--     if fn.empty(fn.glob(install_path)) > 0 then
--         fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', install_path })
--         vim.cmd [[packadd lazy.nvim]]
--         return true
--     end
--     return false
-- end

-- local lazy_bootstrap = ensure_lazy()

-- lazy.nvim plugin list
require("lazy").setup({
    -- plugin manager
    { 'wbthomason/packer.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/nvim-lsp-installer' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- color themes
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- nvim-notify
    { 'rcarriga/nvim-notify' },

    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    -- flash
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        -- @type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },

    -- bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- nvim-window-picker
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    },

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
    { 'iamcco/markdown-preview.nvim',        build = 'cd app && yarn install' },

    -- copilot
    { 'github/copilot.vim' },
    { "zbirenbaum/copilot.lua" },

    -- easymotion
    { 'easymotion/vim-easymotion' },

    -- tagbar
    { 'preservim/tagbar' },

    -- gitgutter
    { 'airblade/vim-gitgutter' },

    -- fugitive
    { 'tpope/vim-fugitive' },

    -- -- nvim-tree
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     version = "*",
    --     lazy = false,
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function()
    --         require("nvim-tree").setup {}
    --     end,
    -- },

    -- neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },

    -- toggleterm
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    -- lazygit
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- diffview
    { "sindrets/diffview.nvim" }
})


if lazy_bootstrap then
    require('lazy').sync()
end
