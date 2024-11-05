-- lazy.nvim plugin list
require("lazy").setup({
    -- plugin manager
    { 'wbthomason/packer.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/nvim-lsp-installer' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },

    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'rcarriga/nvim-notify'
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

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

    { "skanehira/jumpcursor.vim" },

    {
      "folke/flash.nvim",
      event = "VeryLazy",
      -- @type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require'window-picker'.setup()
        end,
    },

    { 'cocopon/iceberg.vim' },

    { 'ibhagwan/fzf-lua' },

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

    { 'tpope/vim-commentary' },

    { 'machakann/vim-highlightedyank' },

    { 'cohama/lexima.vim' },
    { 'machakann/vim-sandwich' },
    { 'tpope/vim-surround' },

    { 'vim-jp/vimdoc-ja' },

    { 'iamcco/markdown-preview.nvim',        build = 'cd app && yarn install' },

    { 'github/copilot.vim' },
    { "zbirenbaum/copilot.lua" },

    { 'easymotion/vim-easymotion' },

    { 'preservim/tagbar' },

    { 'airblade/vim-gitgutter' },

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
