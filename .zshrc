# 表示
export PS1=' %n '$PS1
# alias
alias vi="nvim"
alias vim="nvim"
alias k="kubectl"
alias watch="watch -d "
alias ll="ls -l"
alias l="\ls -F --color=auto"
alias ls="ll -F --color=auto"
alias sl="ll -F --color=auto"
alias lsa="\ls -Fa --color=auto"
alias a="cd ../"
alias aa="cd ../../"
alias aaa="cd ../../../"
alias aaaa="cd ../../../../"
alias g="git"
alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gc="git commit -m"
alias gp="git pull"
alias gsw="git switch"
alias gt='git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias du="du -h"
alias m="mkdir -p"
alias o="open ."

# colordiff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
# 大文字小文字を無視
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 補完の設定
fpath=(path/to/zsh-completions/src $fpath)
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    FPATH=$(brew --prefix)/share/zsh-autosuggestions:$FPATH
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    autoload -Uz compinit
    compinit
fi
zstyle ':completion:*' menu select

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# pure, zshの見た目
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
export FPATH=$FPATH:"$(brew --prefix)/share/zsh/site-functions"
autoload -U promptinit; promptinit
prompt pure

# fzf は曖昧検索してくれるやつ
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#  途中までの履歴を表示できるやつ
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# default bindkey
bindkey "^a" beginning-of-line 
bindkey "^e" end-of-line
bindkey "^f" forward-char
bindkey "^b" backward-char 
bindkey "^k" kill-line
bindkey "^h" vi-backward-delete-char
bindkey "^d" delete-char
bindkey "^r" fzf-history-widget
bindkey "^t" fzf-file-widget

# <C-w>押した時、/と.で止まるようにする
# https://unix.stackexchange.com/questions/250690/how-to-configure-ctrlw-as-delete-word-in-zsh
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    local WORDCHARS=${WORDCHARS/\./}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# cdした時にlsaを実行
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls -al
    fi
}

# function select-git-switch() {
#   target_br=$(
#     git branch -a |
#       fzf --exit-0 --layout=reverse --info=hidden --no-multi --preview-window="right,65%" --prompt="CHECKOUT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git log --color=always" |
#       head -n 1 |
#       perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
#   )
#   if [ -n "$target_br" ]; then
#     BUFFER="git switch $target_br"
#     zle accept-line
#   fi
# }
# zle -N select-git-switch
# bindkey "^b" select-git-switch

function select-git-branch-name() {
  target_br=$(
    git branch -a |
      fzf --exit-0 --layout=reverse --info=hidden --no-multi --preview-window="right,65%" --prompt="SELECT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git log --color=always" |
      head -n 1 |
      perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
  )
  if [ -n "$target_br" ]; then
    BUFFER="$BUFFER$target_br"
  fi
}
zle -N select-git-branch-name
bindkey "^b" select-git-branch-name

# エラーだったら.zsh_historyに追加しない
__update_history() {
  local last_status="$?"

  local HISTFILE=~/.zsh_history
  fc -W
  if [[ ${last_status} -ne 0 ]]; then
    ed -s ${HISTFILE} <<EOF >/dev/null
d
w
q
EOF
  fi
}
precmd_functions+=(__update_history)

# 補完機能を有効にする
autoload -Uz compinit && compinit

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#  ヒストリー系
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

setopt NOCORRECT
setopt AUTO_CD
setopt AUTO_PARAM_KEYS
setopt NO_BEEP

# forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

export MODULAR_HOME="/Users/kazu-gor/.modular"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# puppeteer
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
# gloud
# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
# deno
export DENO_INSTALL="/home/$USER/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# kubernetes
export KUBE_EDITOR="nvim"
export EDITOR="nvim"
# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# python3 
export PATH="/opt/homebrew/bin:$PATH"
# color
export CLICOLOR=1
