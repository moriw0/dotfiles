eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@12/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@12/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@12/lib/pkgconfig"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"
export PATH="/opt/homebrew/opt/python@3.12/bin:$PATH"
export PGGSSENCMODE="disable"
# デプロイ関係の履歴を残さない
export HISTORY_IGNORE="git push *deploy*|git push *heroku*"
# locale のデフォルト値をセット
export LANG=en_US.UTF-8

# 各種起動コマンド
alias ide="bash ~/.tmux-ide.sh"
alias dcu='docker compose up -d'
alias rs='bin/rails s'
alias sk='bundle exec sidekiq -C config/sidekiq.yml'
alias ngr='ngrok http --domain=daily-probable-grubworm.ngrok-free.app 3000'
alias pack='bin/webpack-dev-server'

# Rspec関連
alias spec='bundle exec rspec'
alias specf='bundle exec rspec --format doc'
alias paraspe='bundle exec parallel_rspec'
alias opencov='open coverage/index.html'
alias cspec='COVERAGE=1 bundle exec rspec'

# Railsコマンド
alias rrg='rails routes | grep'
alias rc='bin/rails c'
alias mig='bin/rails db:schema:maintain'

# つな連デプロイコマンド
alias capstg='SSH_IDENTITY_FILE="~/.ssh/id_ed25519" branch=master bundle exec cap staging deploy'

#------ tmux 関連 --------
# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi
# tmux 設定
alias vt='vim ~/.tmux.conf'
alias st='tmux source ~/.tmux.conf'

# Linuxコマンド
alias la='ls -a'
alias ll='ls -l'
alias vv='vim ~/.vimrc'
alias ni='nvim ~/.config/nvim/init.vim'
alias nl='nvim ~/.config/nvim/lua/config/lazy.lua'
alias vz='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias h='history'

# グローバルエイリアス
alias -g G=' | grep'
alias -g F=' | fzf'

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
hash -d s=~/Development/aschild/tsunasou-app/
hash -d d=~/Development/aschild/dialogue-plus-app   
hash -d r=~/Development/aschild/tsunaren-app/
hash -d rl=~/Development/aschild/release/tsunaren-app/
hash -d nvim=~/.config/nvim
hash -d pls=~/.config/nvim/lua/plugins
alias ...='../../'

# Macコマンド
alias C='pbcopy'

# Gitエイリアス
alias gst='git status'
alias ga.='git add .'
alias gd='git diff'
alias gs='git switch'
alias gs-='git switch -'
alias gsc='git switch -c'
alias gsd='git switch develop'
alias grsh='git reset --soft HEAD^'
alias glo='git log --oneline -10'
alias gloa='git log --oneline'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gco='git commit'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gc='git checkout'
alias gb='git branch'

# Dockerエイリアス
alias dcud='docker compose up -d'
alias dcs='docker compose stop'

PROMPT="%F{12}%C%f $ "
RPROMPT="%*"
