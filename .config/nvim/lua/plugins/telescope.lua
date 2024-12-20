local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>e', function()
  builtin.find_files({ hidden = true })
end, { desc = 'Telescope find files (including hidden)' })

vim.keymap.set('n', '<leader>E', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>p', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.oldfiles, { desc = 'Telescope oldfiles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Telescope registers' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
