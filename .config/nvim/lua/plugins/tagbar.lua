vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<Leader>c", ":<C-u>TagbarToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>v", ":<C-u>TagbarShowTag<CR>", { silent = true })

