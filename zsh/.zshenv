ZDOTDIR=$HOME/.config/zsh
PATH="$HOME/.local/bin:$PATH"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

export EDITOR=nvim
export K9S_EDITOR=nvim
export KUBE_EDITOR=nvim
export BROWSER=qutebrowser
export QUTE_QT_WRAPPER=PyQt6

export BATTERY=`ls /sys/class/power_supply | grep BAT`
export WIFI_DEVICE=`iw dev | awk '$1=="Interface"{print $2}'`

VIM=$HOME/.vim
TERM='tmux-256color'

# tmuxp
export DISABLE_AUTO_TITLE='true'

PYFLYBY_PATH=~/.config/pyflyby/.pyflyby:-


if type bat &> /dev/null ; then
    export PAGER="bat --style=plain"
fi


if [[ $(uname) == "Darwin" ]] ; then
    # use gnu binaries
    PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
    PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
    MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
    MANPATH="/opt/homebrew/opt/gawk/libexec/gnuman:$MANPATH"
    MANPATH="/opt/homebrew/opt/gnu-tar/libexec/gnuman:$MANPATH"
    MANPATH="/opt/homebrew/opt/gnu-sed/libexec/gnuman:$MANPATH"
    MANPATH="/opt/homebrew/opt/findutils/libexec/gnuman:$MANPATH"

    # MacPorts is installed to this directory
    PATH="/opt/local/bin:$PATH"

    # homebrew
    HOMEBREW_PREFIX="/opt/homebrew"
    HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    HOMEBREW_REPOSITORY="/opt/homebrew"
    PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
    MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
    INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
fi
