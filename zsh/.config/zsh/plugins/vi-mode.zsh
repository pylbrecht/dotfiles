bindkey -v

function _set_cursor() {
    # https://vt100.net/docs/vt510-rm/DECSCUSR
    printf $'\e[%d q' ${1}
}

function zle-line-init zle-keymap-select {
    case "${KEYMAP}" in
        main|viins|isearch|command)
            _set_cursor 6  # line
            ;;
        vicmd|visual)
            _set_cursor 2  # block
            ;;
        viopp|*)
            _set_cursor 0  # blinking block
            ;;
    esac

    zle reset-prompt
    zle -R
}
zle -N zle-keymap-select
zle -N zle-line-init

function zle-line-finish() {
    _set_cursor 2  # block
}
zle -N zle-line-finish

export KEYTIMEOUT=5

# allow ctrl-e to edit the command line
autoload -Uz edit-command-line
zle -N edit-command-line

# text objects (https://thevaluable.dev/zsh-install-configure-mouseless/)
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
    bindkey -M $km -- '-' vi-up-line-or-history
    for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
        bindkey -M $km $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $km $c select-bracketed
    done
done

# surround (https://thevaluable.dev/zsh-install-configure-mouseless/)
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
