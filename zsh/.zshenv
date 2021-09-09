ZDOTDIR=$HOME/.config/zsh
PATH="$HOME/.local/bin:$PATH"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

EDITOR=nvim
K9S_EDITOR=nvim
KUBE_EDITOR=nvim
VIM=$HOME/.vim
TERM='xterm-256color'

# pyenv
if type pyenv &> /dev/null ; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# tmuxp
export DISABLE_AUTO_TITLE='true'
