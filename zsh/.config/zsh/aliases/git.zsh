alias g='git'

alias ga='git add'
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
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'

alias gf='git fetch'
alias gfa='git fetch --all --prune'

alias gpsup='git push --set-upstream origin $(git branch --show-current)'

alias gl='git pull'
alias glr='git log --extended-regexp  --regexp-ignore-case --grep'
alias gls='git log -S'
alias glo='git log --oneline --decorate'
alias glod='git log --oneline --decorate develop..'
alias glom='git log --oneline --decorate master..'
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
alias grbim='git rebase -i master'
alias grbium='git rebase -i upstream/master'
alias grbm='git rebase master'
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
