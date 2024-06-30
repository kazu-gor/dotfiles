vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>GG', ':<C-u>Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GC', ':<C-u>Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GP', ':<C-u>Git push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GL', ':<C-u>Git log --oneline<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GD', ':<C-u>vert Gdiffsplit !~1<CR>', { noremap = true })
