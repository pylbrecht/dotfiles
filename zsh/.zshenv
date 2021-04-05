ZDOTDIR=$HOME/.config/zsh

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

setopt promptsubst

PROMPT='
$(_user_host)%F{blue}%~%f
%(!.%F{red}.%F{default})>%f '

PROMPT2='< '

RPROMPT='%{$(echotc UP 1)%}$(_git_current_branch)%{$(echotc DO 1)%}'

function _git_current_branch() {
    local ref
    ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return  # no git repo.
        ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    fi
    echo "שׂ %F{green}${ref#refs/heads/}%f"
}

function _user_host() {
    local me

    if [[ -n $SSH_CONNECTION ]]; then
        me="%F{cyan}%n%f@%F{cyan}%m%f:"
    elif [[ $LOGNAME != $USERNAME ]]; then
        me="%F{cyan}%n%f:"
    fi

    if [[ -n $me ]] ; then
        echo $me
    fi
}
