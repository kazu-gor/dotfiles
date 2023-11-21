local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

--plguin
require("packer").startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    -- use 'williamboman/nvim-lsp-installer'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'tpope/vim-fugitive'
    use 'cocopon/iceberg.vim'
    use 'obaland/vfiler.vim'
    use 'obaland/vfiler-fzf'
    use 'ibhagwan/fzf-lua'
    -- nvim-cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "zbirenbaum/copilot-cmp"
    use "f3fora/cmp-spell"
    use "uga-rosa/cmp-dictionary"
    -- jumpcursor
    use 'justinmk/vim-sneak'
    -- use 'skanehira/jumpcursor.vim'
    -- gccでコメント
    use 'tpope/vim-commentary'
    -- highlight
    use 'machakann/vim-highlightedyank'
    -- surround
    use 'cohama/lexima.vim'
    use 'machakann/vim-sandwich'
    use 'tpope/vim-surround'
    -- textDocument
    use 'vim-jp/vimdoc-ja'
    -- markdown preview
    use 'iamcco/markdown-preview.nvim'
    -- jupyter/ascending
    use 'untitled-ai/jupyter_ascending.vim'
    -- copilot
    use 'github/copilot.vim'
    use "zbirenbaum/copilot.lua"
    --
    use 'j-hui/fidget.nvim'
    use 'echasnovski/mini.nvim'
    -- geming cursor
    use { 'gen740/SmoothCursor.nvim',
        config = function()
            require('smoothcursor').setup()
        end
    }
    -- easymotion
    use { 'easymotion/vim-easymotion' }
    -- tagbar
    use { 'preservim/tagbar' }
    --typescript
    use { 'leafgarland/typescript-vim' }
    --mojo
    use { 'czheo/mojo.vim' }
    --graphql
    use { 'jparise/vim-graphql' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- lsp
require('mason').setup()
require("mason-lspconfig").setup()
require('mason-lspconfig').setup_handlers({
    function(server)
        local opt = {
            on_attach = function(client, bufnr)
                -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', ':vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
    settings = {
        plugins = {
            pycodestyle = {
                ignore = { "E501" },
                enabled = true
            }
        }
    }
}
nvim_lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- LSPの警告フォーマット
-- ref: https://dev.classmethod.jp/articles/eetann-change-neovim-lsp-diagnostics-format/
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        format = function(diagnostic)
            return string.format('%s (%s: %s)', diagnostic.message, diagnostic.source, diagnostic.code)
        end,
    },
})

-- completion
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
        -- ['<C-l>'] = cmp.mapping.complete(),
        -- ['<C-e>'] = cmp.mapping.abort(),
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

-- mini.nvim
require('mini.statusline').setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 9999 }) -- 常にShort表示
            local git           = MiniStatusline.section_git({ trunc_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location      = MiniStatusline.section_location({ trunc_width = 9999 }) -- 常にShort表示

            local get_lsp_progress = function()
                local prog = vim.lsp.util.get_progress_messages()[1]
                if not prog then return '' end

                local title = prog.title or ''
                local per = prog.percentage or 0

                return string.format('%s (%s%%%%)', title, per)
            end

            return MiniStatusline.combine_groups({
                { hl = mode_hl, strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFilename', strings = { get_lsp_progress() } },
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl, strings = { location } },
            })
        end,
        inactive = nil,
    },
    use_icons = true,
    set_vim_settings = false,
})
-- smoothcursor.nvim
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
