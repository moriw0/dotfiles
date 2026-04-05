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

# tmux
alias t='tmux'
alias ta='tmux attach'
alias tns='tmux new -s'
alias vt='nvim ~/.tmux.conf'
alias st='tmux source ~/.tmux.conf'

# コマンド
alias vi='nvim'
alias la='ls -la'
alias ll='ls -l'
alias vv='vim ~/.vimrc'
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vzs='nvim ~/.zshrc_secret'
alias szs='source ~/.zshrc_secret'
alias h='history'
alias C='pbcopy'
alias ...='../../'

# グローバルエイリアス
alias -g G=' | grep'
alias -g F=' | fzf'
alias -g X=' | xargs'
alias -g N='--name-only'
alias -g S='--stat'

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
