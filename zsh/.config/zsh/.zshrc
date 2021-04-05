setopt NO_CASE_GLOB
setopt AUTO_CD

unsetopt CORRECT
unsetopt CORRECT_ALL

autoload -Uz compinit && compinit

# case insensitive, partial completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'm:{a-zA-Z}={A-Za-z}'

# vi mode
bindkey -v
export KEYTIMEOUT=5

# allow ctrl-e to edit the command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

# allow ctrl-r and ctrl-s to search the history
bindkey '^p' up-history
bindkey '^n' down-history

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward


# source plugins
for plugin in $ZDOTDIR/plugins/*.zsh ; do
    source $plugin
done

# source aliases
for _alias in $ZDOTDIR/aliases/*.zsh ; do
    source $_alias
done
