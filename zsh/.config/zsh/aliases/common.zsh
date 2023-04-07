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
