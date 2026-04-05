eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_OPTS_FILE=~/.fzfrc

# locale
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export EDITOR="nvim"

# キーバインド
## 直前のコマンドの最後の単語を呼び出す(Esc .)
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^[.' insert-last-word

## コマンドを vi で編集する (Esc e)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^[e" edit-command-line

## undo, redo (Esc u, r)
bindkey "^[u" undo
bindkey "^[r" redo

## 編集中のコマンドを stash する (^u)
bindkey "^U" push-line

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

# Git Worktree 切り替え
wt() {
  local selected
  selected=$(git worktree list | fzf --layout=reverse \
    --preview 'git -C {1} log --oneline --color=always -20' \
    --preview-window=right:60% | awk '{print $1}')
  [[ -n "$selected" ]] && cd "$selected"
}
