if [[ -f $HOME/.momox ]] ; then
    source $HOME/.momox
fi

if [[ $(systemctl -q is-active graphical.target) -eq "inactive" && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
