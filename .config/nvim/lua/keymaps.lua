-- keymap
vim.g.mapleader = " "
-- vim.api.nvim_set_keymap('n', '<leader><leader>', ':<C-u>e ./<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>r', ':<C-u>e ./<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':<C-u>w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':<C-u>bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':<C-u>bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':<C-u>bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>=', ':<C-u>resize +5<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<C-W>-', ':<C-u>resize -5<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>\\', ':<C-u>vertical split<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>-', ':<C-u>horizontal split<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W>>', ':<C-u>vertical resize +10<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-W><', ':<C-u>vertical resize -10<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { silent = true })

-- vim.api.nvim_set_keymap('t', '<C-W>j', '<CMD>wincmd j<CR>', {silent=true})
-- vim.api.nvim_set_keymap('t', '<C-W>k', '<CMD>wincmd k<CR>', {silent=true})
-- vim.api.nvim_set_keymap('t', '<C-W>h', '<CMD>wincmd h<CR>', {silent=true})
-- vim.api.nvim_set_keymap('t', '<C-W>l', '<CMD>wincmd l<CR>', {silent=true})

-- like a mac keymap -----------------------------------------------------------
vim.api.nvim_set_keymap('i', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })

-- files
vim.api.nvim_set_keymap("", ",q", ":<C-u>e $HOME/.config/nvim/init.lua<CR>", { silent = true })
vim.api.nvim_set_keymap("", ",w", ":<C-u>e $HOME/.zshrc<CR>", { silent = true })

-- change current directory to the file directory
vim.api.nvim_set_keymap("", '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})

-- terminal
vim.api.nvim_set_keymap("n", "tt", ":<C-u>terminal<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "tx", ":<C-u>belowright new<CR>:<C-u>terminal<CR>", {noremap = true})
