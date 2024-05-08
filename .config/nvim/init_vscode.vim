if exists('g:vscode')
  call plug#begin('~/.vim/autoload')
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-commentary' " visual modeに移動して、gcでコメントアウトが可能
    Plug 'tpope/vim-surround'
    Plug 'vim-jp/vimdoc-ja'
    Plug 'machakann/vim-sandwich'
  call plug#end()

  " sneak settings
  map f <Plug>Sneak_s
  map F <Plug>Sneak_S
  let g:sneak#label = 2

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
  " inoremap <silent> jj <ESC>

  " ノーマルモードでは初期は英数字
  let g:im_select_default = 'com.google.inputmethod.Japanese.Roman' 
  
  " insertを離れたときに入力モードを切り替える
  autocmd InsertLeave * :silent !/usr/local/bin/im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman 
endif

