alias -g V=' | xargs nvim'
alias -g L=' | less'
alias -g LC='--color=always | less -r'

if [[ `uname` == "Darwin" ]] ; then
    alias -g C=' | pbcopy'
else
    alias -g C=' | xclip -selection clipboard'
fi

alias -g X=' | xargs'
alias -g F=' | fzf'
alias -g BP=' | steck paste -'

# taken from zsh-lovers
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
