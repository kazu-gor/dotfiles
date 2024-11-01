vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = '*',
  command = 'startinsert',
})

vim.cmd 'autocmd TermOpen * startinsert'

vim.cmd [[
if executable('fcitx5')
  let g:fcitx_state = 1
  augroup fcitx_savestate
    autocmd!
    autocmd InsertLeave * let g:fcitx_state = str2nr(system('fcitx5-remote'))
    autocmd InsertLeave * call system('fcitx5-remote -c')
    autocmd InsertEnter * call system(g:fcitx_state == 1 ? 'fcitx5-remote -c': 'fcitx5-remote -o')
  augroup END
endif
]]

vim.cmd[[colorscheme tokyonight-night]]
