setopt NO_CASE_GLOB
setopt AUTO_CD

unsetopt CORRECT
unsetopt CORRECT_ALL

autoload -Uz compinit && compinit
setopt menu_complete

# use menu selection
zstyle ':completion*:default' menu 'select=0'

# use the vi navigation keys in menu completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'q' send-break
bindkey -M menuselect '\e' accept-line

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
