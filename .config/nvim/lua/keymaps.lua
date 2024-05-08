-- keymap
vim.g.mapleader = " "
-- vim.api.nvim_set_keymap('n', '<leader><leader>', ':<C-u>e ./<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':<C-u>e ./<CR>', { noremap = true })
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
-- 'ibhagwan/fzf-lua' ----------------------------------------------------------
opt = { noremap = true, silent = true }
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
-- 'tpope/vim-fugitive' --------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>GG', ':<C-u>Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GC', ':<C-u>Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GP', ':<C-u>Git push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GL', ':<C-u>Git log --oneline<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>GD', ':<C-u>vert Gdiffsplit !~1<CR>', { noremap = true })
-- 'skanehira/jumpcursor' ------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>j', '<Plug>(jumpcursor-jump)', { noremap = false, silent = true })

-- 'justinmk/vim-sneak' --------------------------------------------------------
-- vim.api.nvim_set_keymap('', 'f', '<Plug>Sneak_s', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('', 'F', '<Plug>Sneak_S', { noremap = false, silent = true })

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- files
vim.api.nvim_set_keymap("", ",q", ":<C-u>e $HOME/.config/nvim/init.lua<CR>", { silent = true })
vim.api.nvim_set_keymap("", ",w", ":<C-u>e $HOME/.zshrc<CR>", { silent = true })
-- easymotion
vim.api.nvim_set_keymap("", "<Leader>j", "<Plug>(easymotion-bd-w)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>j", "<Plug>(easymotion-overwin-w)", { silent = true })
vim.api.nvim_set_keymap("", "<Leader>l", "<Plug>(easymotion-bd-jk)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<Plug>(easymotion-overwin-line)", { silent = true })
vim.api.nvim_set_keymap("", "<Leader>k", "<Plug>(easymotion-bd-f)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-overwin-f)", { silent = true })
-- tagbar
vim.api.nvim_set_keymap("n", "<Leader>c", ":<C-u>TagbarToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>v", ":<C-u>TagbarShowTag<CR>", { silent = true })
-- change current directory to the file directory
vim.api.nvim_set_keymap("", '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
vim.api.nvim_set_keymap("n", '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
