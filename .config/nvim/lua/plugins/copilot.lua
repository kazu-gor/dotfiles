vim.g.copilot_no_tab_map = true

vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

