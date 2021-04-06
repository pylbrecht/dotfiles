if [[ `uname` == "Darwin" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi

alias ll='ls -l'
alias la='ls -al'

alias pydoc="python3 -m pydoc"
