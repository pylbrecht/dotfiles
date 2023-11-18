if type lsd &> /dev/null ; then
    alias ls='lsd'
elif [[ `uname` == "Darwin" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi

alias ll='ls -l'
alias la='ls -al'

alias pydoc="python3 -m pydoc"
alias vim="nvim"

lfcd() {
    dir=$(lf -print-last-dir "$@")
    while ! cd "$dir" 2> /dev/null
    do
        dir=$(dirname "$dir")
    done
}

take() {
    mkdir -p "$1" && cd "$1"
}

r() {
    cd "$(git rev-parse --show-toplevel 2>/dev/null)"
}
