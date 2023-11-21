" python path
if has('nvim') && !filereadable(expand('~/.vim_no_python'))
  let s:python3 = system('which python3')
  if strlen(s:python3) != 0
    let s:python3_dir = $HOME . '/.vim/python3'
    if ! isdirectory(s:python3_dir)
      call system('python3 -m venv ' . s:python3_dir)
      call system('source ' . s:python3_dir . '/bin/activate && pip install neovim flake8 jedi')
    endif
    let g:python3_host_prog = s:python3_dir . '/bin/python'
    let $PATH = s:python3_dir . '/bin:' . $PATH
  endif
endif

" Plug loads
call plug#begin('~/.vim/autoload')
  " ddc.vim本体
  Plug 'Shougo/ddc.vim'
  " DenoでVimプラグインを開発するためのプラグイン
  Plug 'vim-denops/denops.vim'
  " ポップアップウィンドウを表示するプラグイン
  Plug 'Shougo/pum.vim'
  " カーソル周辺の既出単語を補完するsource
  Plug 'Shougo/ddc-around'
  " ファイル名を補完するsource
  Plug 'LumaKernel/ddc-file'
  " 入力中の単語を補完の対象にするfilter
  Plug 'Shougo/ddc-matcher_head'
  " 補完候補を適切にソートするfilter
  Plug 'Shougo/ddc-sorter_rank'
  " 補完候補の重複を防ぐためのfilter
  Plug 'Shougo/ddc-converter_remove_overlap'
  " nvim lsp
  Plug 'Shougo/ddc-nvim-lsp'
  " Plug 'neovim/nvim-lspconfig'
  Plug 'Shougo/ddc-nextword'
  
  " sneak
  Plug 'justinmk/vim-sneak'
  Plug 'skanehira/jumpcursor.vim' 
  " fzf系
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " ファイル検索
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary' " visual modeに移動して、gcでコメントアウトが可能
  " lsp
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/vim-lsp'
  " theme"
  Plug 'tomasr/molokai'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'brglng/vim-im-select'
  Plug 'machakann/vim-highlightedyank'
  " Plug 'ntk148v/vim-horizon'
  " Plug 'frazrepo/vim-rainbow'
  Plug 'tpope/vim-surround'
  Plug 'cohama/lexima.vim'
  " Plug 'mattn/emmet-vim'
  " Plug 'mattn/vim-maketable'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-jp/vimdoc-ja'
  Plug 'machakann/vim-sandwich'
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/async.vim'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  " Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'mattn/ctrlp-launcher'
  " Plug 'sgur/ctrlp-extensions.vim'
  " Plug 'haya14busa/vim-asterisk'
  " Plug 'thinca/vim-quickrun'
  " Plug 'mattn/sonictemplate-vim'
  " Plug 'mattn/vim-sonictemplate'
  " Plug 'Shougo/neosnippet.vim'
  " Plug 'Shougo/neosnippet-snippets'
  " Plug 'davidhalter/jedi-vim'
call plug#end()

" ddc settings
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'nvim-lsp',
 \ 'file',
 \ 'nextword',
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ 'around': {'mark': 'Around'},
 \ 'nextword': {'mark': 'nextword'},
 \ 'nvim-lsp': {
 \   'mark': 'L', 
 \   'forceCompletionPattern': '\.\w*|:\w*|->\w*', 
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ },
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

" sneak settings
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#label = 2

" lsp settings
function! s:on_lsp_buffer_enabled() abort
setlocal omnifunc=lsp#complete
setlocal signcolumn=yes
if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
nmap gd <plug>(lsp-definition)
nmap <leader>rn <plug>(lsp-rename)
nmap [g <plug>(lsp-previous-diagnostic)
nmap ]g <plug>(lsp-next-diagnostic)
nmap ga <plug>(lsp-code-action)
nmap K <plug>(lsp-hover)
nmap [j <Plug>(jumpcursor-jump)
inoremap <buffer> <expr><c-f> lsp#scroll(+4)
inoremap <buffer> <expr><c-d> lsp#scroll(-4)

let g:lsp_format_sync_timeout = 1000
let g:lsp_diagnostics_float_cursor = 1
autocmd! BufWritePre .tsx,.ts,.rs,.go call execute('LspDocumentFormatSync')

endfunction

augroup lsp_install
au!
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""" <Tab>で候補をナビゲート
" function! s:check_back_space() abort
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<Tab>" :
" \ coc#refresh()

""" <Tab>で次、<S+Tab>で前
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" skanehira/jumpcursor.vim
nmap [j <Plug>(jumpcursor-jump)

" lexima SETTINGS
" call lexima#add_rule({'char': '<', 'input_after': '>'})
" call lexima#add_rule({'char': '>', 'at': '\%#>', 'leave': 1})


" Airline SETTINGS
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" vimの背景透過
colorscheme molokai
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

set shell=/usr/local/bin/zsh " コマンドの際にはzshを使う
set tabstop=2 " タブに変換されるサイズ
set shiftwidth=2 " Indentの幅
set expandtab " タブの入力の際にスペース
set textwidth=0 " ワードラッピング無し
set nosmarttab
set clipboard=unnamedplus " クリップボードへの登録
set number " 行番号を表示
set hlsearch " 検索結果のハイライト
set ignorecase " 検索パターンにおいて大文字と小文字を区別しない
set incsearch " 検索コマンドを打ち込んでる間にも、打ち込んだところまで検査結果を表示する
set encoding=UTF-8
set noautoindent
set softtabstop=2
set autoindent

" 削除キーでyankしない
nnoremap x "_x
nnoremap D "_D
" macのショートカット適用
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

noremap! <C-a> <HOME>
noremap! <C-e> <END>
noremap! <C-d> <Del>

vnoremap x "_x

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" jj esc
inoremap <silent> jj <ESC>

" ノーマルモードでは初期は英数時
" let g:im_select_default = 'com.google.inputmethod.Japanese.Roman' 

" insertを離れたときに入力モードを切り替える
" autocmd InsertLeave * :silent !/usr/local/bin/im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman 
