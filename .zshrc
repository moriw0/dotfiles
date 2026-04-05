if [ ! -d $HOME/.oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_OPTS_FILE=~/.fzfrc

if [ -f ~/.zshrc_secret ]; then
  source ~/.zshrc_secret
fi

# locale のデフォルト値をセット
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export EDITOR="nvim"

# 各種起動コマンド
alias ide="bash ~/.tmux-ide.sh"
alias dcu='docker compose up -d'
alias dcs='docker compose stop'
alias dce='docker compose exec app'
alias dcbe='docker compose exec app bundle exec'

# Railsコマンド
alias rs='bin/rails s'
alias rc='bin/rails c'
alias rrg='rails routes | grep'

# Rspec関連
alias spec='bundle exec rspec'
alias specf='bundle exec rspec --format doc'
alias be='bundle exec'

# tmux 設定
alias t='tmux'
alias ta='tmux attach'
alias tns='tmux new -s'
alias vt='nvim ~/.tmux.conf'
alias st='tmux source ~/.tmux.conf'

# Linuxコマンド
alias vi='nvim'
alias la='ls -la'
alias ll='ls -l'
alias vv='vim ~/.vimrc'
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vzs='nvim ~/.zshrc_secret'
alias szs='source ~/.zshrc_secret'
alias h='history'

# グローバルエイリアス
alias -g G=' | grep'
alias -g F=' | fzf'
alias -g X=' | xargs'
alias -g N='--name-only'
alias -g S='--stat'

## 直前のコマンドの最後の単語を呼び出す(Esc .)
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^[.' insert-last-word

## コマンドを vi で編集する (Esc e)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^[e" edit-command-line

## undo, redo のキーバインド(Esc u, r)
bindkey "^[u" undo
bindkey "^[r" redo

## 編集中のコマンドを stash する (^u)
bindkey "^U" push-line

#-----History関連----
export HISTFILE=${HOME}/.zsh_history
export SAVEHIST=100000
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
#--------------------

# ディレクトリハッシュ
setopt auto_cd #ディレクトリ名だけで cd する
hash -d dow=~/Downloads
hash -d doq=~/Documents
hash -d pic=~/Pictures
hash -d dv=~/Development
hash -d dot=~/dotfiles
alias ...='../../'

# Git Worktree 切り替え
wt() {
  local selected
  selected=$(git worktree list | fzf --layout=reverse \
    --preview 'git -C {1} log --oneline --color=always -20' \
    --preview-window=right:60% | awk '{print $1}')
  [[ -n "$selected" ]] && cd "$selected"
}

# Macコマンド
alias C='pbcopy'

# Gitエイリアス
alias ggn='git grep -n'
alias ga.='git add .'
alias gap='git add -p'
alias gdd='git diff develop'
alias gdn='git diff --name-only'
alias gs='git switch'
alias gs-='git switch -'
alias gsc='git switch -c'
alias gsd='git switch develop'
alias gsts='git stash'
alias grsh='git reset --soft HEAD^'
alias gloa='git log --oneline'
alias gcam='git commit --amend'
alias gcmm='git commit -m'
alias gcoo='git commit'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias grs='git restore --staged'

