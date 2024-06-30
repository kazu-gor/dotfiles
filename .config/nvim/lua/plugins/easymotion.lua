vim.g.mapleader = " "

vim.api.nvim_set_keymap("", "<Leader>j", "<Plug>(easymotion-bd-w)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>j", "<Plug>(easymotion-overwin-w)", { silent = true })
vim.api.nvim_set_keymap("", "<Leader>l", "<Plug>(easymotion-bd-jk)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<Plug>(easymotion-overwin-line)", { silent = true })
vim.api.nvim_set_keymap("", "<Leader>k", "<Plug>(easymotion-bd-f)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-overwin-f)", { silent = true })

