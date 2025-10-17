eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"

if [ -f ~/.zshrc_secret ]; then
  source ~/.zshrc_secret
fi

# locale のデフォルト値をセット
export LANG=en_US.UTF-8
export EDITOR="nvim"

# 各種起動コマンド
alias ide="bash ~/.tmux-ide.sh"
alias dcu='docker compose up -d'
alias dcs='docker compose stop'

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
alias la='ls -a'
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
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
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

# Macコマンド
alias C='pbcopy'

# Gitエイリアス
alias ggn='git grep -n'
alias gst='git status'
alias ga='git add'
alias ga.='git add .'
alias gap='git add -p'
alias gau='git add -u'
alias gd='git diff'
alias gdd='git diff develop'
alias gds='git diff --staged'
alias gdn='git diff --name-only'
alias gs='git switch'
alias gs-='git switch -'
alias gsc='git switch -c'
alias gsd='git switch develop'
alias gsh='git stash'
alias gshl='git stash list'
alias gshd='git stash drop'
alias gsha='git stash apply'
alias grsh='git reset --soft HEAD^'
alias glo='git log --oneline -10'
alias gloa='git log --oneline'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gco='git commit'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias grs='git restore --staged'
alias gc='git checkout'
alias gb='git branch'

PROMPT="%F{12}%C%f $ "
RPROMPT="%*"
