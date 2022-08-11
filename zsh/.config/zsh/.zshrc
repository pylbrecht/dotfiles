setopt no_case_glob
setopt auto_cd
setopt menu_complete
setopt globdots

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

if type pyenv &> /dev/null ; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# FIXME: if tmux.service is not available this crashes the terminal resulting
# in being locked out of entering my shell. Maybe adding a check like this should be included:
# systemctl --user list-unit-files | grep "tmux\.service"
#
# This requires autostarting tmux with systemd: https://wiki.archlinux.org/title/Tmux#Autostart_with_systemd
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    if ! systemctl --user is-active --quiet tmux.service; then
        systemctl --user start tmux.service
    fi
    exec tmux attach-session -d -t "${USER}" >/dev/null 2>&1
fi
