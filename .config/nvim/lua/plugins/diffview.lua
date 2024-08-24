local opts = { noremap = true, silent = true }

-- lazygit
vim.api.nvim_set_keymap('n', '<leader>g', ':LazyGit<CR>', opts)
-- diffview
require("diffview").setup()
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewOpen<CR>', opts)
