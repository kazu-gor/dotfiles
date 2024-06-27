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

    -- jumpcursor
    { 'justinmk/vim-sneak' },

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
})

-- Configure `ruff-lsp`
require('lspconfig').ruff_lsp.setup {
    init_options = {
        settings = {
            args = {},
        }
    }
}

require('lspconfig').pyright.setup {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { '*' },
            },
        },
    },
}

-- lsp setup
require('mason').setup()
require("mason-lspconfig").setup()
require('mason-lspconfig').setup_handlers({
    function(server)
        local opt = {
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', ':vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
            end,
            capabilities = require('cmp_nvim_lsp').default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )
        }
        require('lspconfig')[server].setup(opt)
    end
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { separator = true }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { separator = true }
)
local nvim_lsp = require('lspconfig')
nvim_lsp.pylsp.setup {
    cmg = { "pylsp" },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "E501", 'W391' },
                    enabled = true,
                    maxLineLength = 100
                }
            }
        }
    }
}
nvim_lsp.pyright.setup {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                stubPath = "/usr/local/lib/python3.9/site-packages"
            }
        }
    }
}

-- LSP diagnostics format
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
  virtual_text = {
    format = function(diagnostic)
      if diagnostic.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
        return string.format('%s (%s: %s)', diagnostic.message, diagnostic.source, diagnostic.code)
      else
        return 'Warning'
      end
    end,
  },
})

-- completion setup
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<TAB>'] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = true,
    },
})
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})

-- smoothcursor.nvim setup
require("smoothcursor").setup({
    priority = 10,
    fancy = {
        enable = true,
        head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
        body = {
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "•", texthl = "SmoothCursorWhite" },
            { cursor = ".", texthl = "SmoothCursorWhite" },
            { cursor = ".", texthl = "SmoothCursorWhite" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" },
    },
    disabled_filetypes = {
        "TelescopePrompt",
        "TelescopeResults",
        "gitblame",
        "css",
        "noice",
        "lazy",
    },
})

if lazy_bootstrap then
    require('lazy').sync()
end

