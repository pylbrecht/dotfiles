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
alias gos="gcloud container clusters get-credentials solaris-stage --zone europe-west3-a --project momox-so-stage"
alias gop="gcloud container clusters get-credentials solaris --zone europe-west3 --project momox-so"
