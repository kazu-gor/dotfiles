-- auto command
vim.cmd "let g:fzf_preview_window = ['right:70%', 'ctrl-/']"

-- keymaps
vim.g.mapleader = " "
local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>e', "<cmd>lua require('fzf-lua').files()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').git_status()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require('fzf-lua').live_grep()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('fzf-lua').oldfiles()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>d', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>s', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>", opt)
