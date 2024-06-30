-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = '20%',
        side = 'right',
        signcolumn = 'yes',
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = 'name',
        icons = {
          glyphs = {
            git = {
              unstaged = '!', renamed = '»', untracked = '?', deleted = '✘',
              staged = '✓', unmerged = '', ignored = '◌',
            },
          },
        },
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        expand_all = {
          max_folder_discovery = 100,
          exclude = { '.git', 'target', 'build' },
        },
    },
    on_attach = 'default'
})

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
