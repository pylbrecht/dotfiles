if [[ `uname` == "Darwin" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi

alias ll='ls -l'
alias la='ls -al'
