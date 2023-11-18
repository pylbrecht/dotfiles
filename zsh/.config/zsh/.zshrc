setopt no_case_glob
setopt extendedglob
setopt auto_cd
setopt menu_complete
setopt globdots

unsetopt CORRECT
unsetopt CORRECT_ALL

# completions
fpath=($ZDOTDIR/completions $fpath)

# homebrew completions
if [[ `uname` == 'Darwin' ]] ; then
    fpath=(/opt/homebrew/share/zsh/site-functions/ $fpath)
fi

autoload -Uz compinit && compinit
setopt menu_complete

# use menu selection
zstyle ':completion*:default' menu 'select=0'

# show commits first when completing git rebase
zstyle ':completion:*:complete:git-rebase:*argument-*:' tag-order 'commit-objects'

# colorize commit completion output, example:
# d60641c  -- [HEAD^]   Alacritty: hide mouse when typing (13 days ago)
zstyle ':completion:*:complete:git*:commit*' list-colors '=(#b)([[:xdigit:]]*)  -- \[(*)\] * ([[:punct:]]*[[:punct:]])=37=33=31=32'

# use the vi navigation keys in menu completion
zmodload zsh/complist

# case insensitive, partial completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'm:{a-zA-Z}={A-Za-z}'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# source plugins
for plugin in $ZDOTDIR/plugins/*.zsh ; do
    source $plugin
done

# source aliases
for _alias in $ZDOTDIR/aliases/*.zsh ; do
    source $_alias
done

source $ZDOTDIR/bindings.zsh

if type pyenv &> /dev/null ; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
