# fwip - checkout from recent git branches
fwip() {
  local recent_branches branch

  recent_branches=$(
    git for-each-ref --sort='authordate:iso8601' \
      --format=' %(color:green)%(authordate:relative)%09%(color:white)%(refname:short)' \
      --color=always \
      refs/heads
    ) || return

  target=$(echo "$recent_branches" | tac | fzf --ansi) || return

  git checkout $(echo $target | awk -F'\t' '{print $2}')
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

git_default_branch_name() {
  git remote show origin | sed -n '/HEAD branch/s/.*: //p'
}

alias g='git'

alias ga='git add'
alias gaa='git add .'
alias gapa='git add --patch'
alias gau='git add --update'

alias gb='git branch'
alias gbD='git branch -D'
alias gbl='git blame -b -w'

alias gbi='git bisect start'
alias gbir='git bisect run'
alias gbig='git bisect good'
alias gbib='git bisect bad'
alias gbis='git bisect skip'
alias gbir='git bisect reset'
alias gbil='git bisect log'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcb='git checkout -b'
alias gcf='git commit -v --fixup'

_git_clone_from_arg_or_clipboard () {
    if [[ $(uname) == "Darwin" ]] ; then
      local REPO_URL=$(pbpaste)
    else
      local REPO_URL=$(xclip -o)
    fi

    git clone --recurse-submodules ${1:-$REPO_URL}
}
alias gcl='_git_clone_from_arg_or_clipboard'

alias gclean='git clean -id'

git_checkout_main () {
  git checkout $(git_default_branch_name)
}
alias gcm='git_checkout_main'
alias gcd='git checkout develop'

alias gco='git checkout'
alias gcop='git checkout --patch'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
# list files with merge conflicts
alias gdu='git diff --name-only --diff-filter=U'
alias gds='git diff --staged'

alias gf='git fetch'
alias gfa='git fetch --all --prune'

alias gpsup='git push --set-upstream origin $(git branch --show-current)'

alias gl='git pull'
alias glr='git log --extended-regexp  --regexp-ignore-case --grep'
alias gls='git log -S'
alias glg="git log --oneline --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glo='git log --oneline --decorate'
alias glod='git log --oneline --decorate develop..'
alias glom='git log --oneline --decorate master..'
alias gloum='git log --oneline --decorate upstream/master..'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'

alias gm='git merge'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'
alias grbi='git rebase -i'
alias grbia='git rebase -i --autosquash'
alias grbim='git rebase -i master'
alias grbium='git rebase -i upstream/master'

git_rebase_main () {
  git rebase $(git_default_branch_name)
}
alias grbm='git_rebase_main'

alias grbum='git rebase upstream/master'
alias grbs='git rebase --skip'
alias grh='git reset'
alias grhh='git reset --hard'
alias grm='git rm'
alias grv='git remote -v'

alias gst='git status'

alias gsta='git stash push --include-untracked'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'

alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'

alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwr='git worktree remove'
