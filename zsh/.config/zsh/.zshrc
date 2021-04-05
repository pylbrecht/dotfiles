setopt NO_CASE_GLOB
setopt AUTO_CD

unsetopt CORRECT
unsetopt CORRECT_ALL

autoload -Uz compinit && compinit

# case insensitive, partial completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'm:{a-zA-Z}={A-Za-z}'

# source plugins
for plugin in $ZDOTDIR/plugins/*.zsh ; do
    source $plugin
done

# source aliases
for _alias in $ZDOTDIR/aliases/*.zsh ; do
    source $_alias
done
