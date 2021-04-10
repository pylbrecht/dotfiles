setopt promptsubst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "שׂ %F{green}%b %u%c %f"
zstyle ':vcs_info:git*' actionformats "שׂ %F{green}%b (%a)%f"
precmd () { vcs_info }


PROMPT='
$(_user_host)%F{blue}%~%f
%(!.%F{red}.%F{default})%f '

PROMPT2=' '

RPROMPT='%{$(echotc UP 1)%}${vcs_info_msg_0_}%{$(echotc DO 1)%}'

function _user_host() {
    local me

    if [[ -n $SSH_CONNECTION ]]; then
        me="%F{cyan}%n%f@%F{cyan}%m%f "
    elif [[ $LOGNAME != $USERNAME ]]; then
        me="%F{cyan}%n%f "
    fi

    if [[ -n $me ]] ; then
        echo $me
    fi
}
