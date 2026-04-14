# yazi shell integration (cd on exit)
yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Git Worktree 切り替え
wt() {
  local selected
  selected=$(git worktree list | fzf --layout=reverse \
    --preview 'git -C {1} log --oneline --color=always -20' \
    --preview-window=right:60% | awk '{print $1}')
  [[ -n "$selected" ]] && cd "$selected"
}

# ghq + fzf でリポジトリ移動
cd_git_repo() {
  local selected="$(ghq list | fzf)"
  if [[ -n "$selected" ]]; then
    cd "$(ghq root)/$selected"
  fi
}

# fzf でディレクトリ移動
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Git リポジトリ内でディレクトリ移動
fdgit() {
  local top_dir
  top_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [ -z "$top_dir" ]; then
    echo "Not in a Git repository."
    return 1
  fi

  local dir
  dir="$(
    cd "$top_dir" || return 1
    find . -type d -not -path '*/.git/*' 2>/dev/null | fzf
  )"

  [ -z "$dir" ] && return
  cd "$top_dir/$dir"
}

# fzf でブランチ切り替え
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fzf でリモートブランチ含めて切り替え
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# GitHub issue を fzf で検索してターミナルで表示
ghi() {
  local issues issue number
  issues="$(gh issue list)" || return 1
  issue="$(echo "$issues" | fzf --no-multi)" || return 1
  number="${issue%%[[:space:]]*}"
  number="${number#'#'}"
  gh issue view "$number"
}

# GitHub issue を fzf で検索してブラウザで表示
ghiw() {
  local issues issue number
  issues="$(gh issue list)" || return 1
  issue="$(echo "$issues" | fzf --no-multi)" || return 1
  number="${issue%%[[:space:]]*}"
  number="${number#'#'}"
  gh issue view --web "$number"
}

# GitHub PR を fzf で検索してターミナルで表示
ghpr() {
  local prs pr number
  prs="$(gh pr list)" || return 1
  pr="$(echo "$prs" | fzf --no-multi)" || return 1
  number="${pr%%[[:space:]]*}"
  number="${number#'#'}"
  gh pr view "$number"
}

# GitHub PR を fzf で検索してブラウザで表示
ghprw() {
  local prs pr number
  prs="$(gh pr list)" || return 1
  pr="$(echo "$prs" | fzf --no-multi)" || return 1
  number="${pr%%[[:space:]]*}"
  number="${number#'#'}"
  gh pr view --web "$number"
}

# キーバインド
# ctrl+o: ghq リポジトリ移動
_cd_git_repo_widget() { cd_git_repo; zle reset-prompt }
zle -N _cd_git_repo_widget
bindkey '^o' _cd_git_repo_widget

# ctrl+f: ディレクトリ移動
_fd_widget() { fd; zle reset-prompt }
zle -N _fd_widget
bindkey '^f' _fd_widget

# alt+f: Git リポジトリ内ディレクトリ移動
_fdgit_widget() { fdgit; zle reset-prompt }
zle -N _fdgit_widget
bindkey '^[f' _fdgit_widget

# alt+b: ブランチ切り替え
_fbr_widget() { fbr; zle reset-prompt }
zle -N _fbr_widget
bindkey '^[b' _fbr_widget

# alt+w: Git Worktree 切り替え
_wt_widget() { wt; zle reset-prompt }
zle -N _wt_widget
bindkey '^[w' _wt_widget
