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
bindkey -v

# allow ctrl-e to edit the command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^p' up-history
bindkey '^n' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
