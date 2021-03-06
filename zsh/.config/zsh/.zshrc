setopt no_case_glob
setopt auto_cd
setopt menu_complete

unsetopt CORRECT
unsetopt CORRECT_ALL

autoload -Uz compinit && compinit
setopt menu_complete

# use menu selection
zstyle ':completion*:default' menu 'select=0'

# use the vi navigation keys in menu completion
zmodload zsh/complist

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

source $ZDOTDIR/bindings.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/completion.zsh.inc'; fi
