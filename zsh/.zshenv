ZDOTDIR=$HOME/.config/zsh
PATH="$HOME/.local/bin:$PATH"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

EDITOR=vim
TERM='xterm-256color'

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
