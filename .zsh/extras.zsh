eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_OPTS_FILE=~/.fzfrc
source <(fzf --zsh)
export LESS="-FRX"

# locale
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export EDITOR="nvim"

# キーバインド
## 直前のコマンドの最後の単語を呼び出す(Esc .)
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^[.' insert-last-word

## コマンドを vi で編集する (Ctrl g)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^g" edit-command-line

## undo, redo (Esc u, r)
bindkey "^[u" undo
bindkey "^[r" redo

## 編集中のコマンドを stash する (^u)
bindkey "^U" push-line

## kitty keyboard protocol: Ctrl+[ / ESC を ESC として扱う
_kitty_escape() {
  local key
  read -k key
  zle -U $'\e'"$key"
}
zle -N _kitty_escape
bindkey '\e[91;5u' _kitty_escape

# History
export HISTFILE=${HOME}/.zsh_history
export SAVEHIST=100000
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# ディレクトリ
setopt auto_cd
hash -d dow=~/Downloads
hash -d doq=~/Documents
hash -d pic=~/Pictures
hash -d dv=~/Development
hash -d dot=~/dotfiles
