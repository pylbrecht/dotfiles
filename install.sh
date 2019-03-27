#!/bin/bash

REQUIRED_TOOLS=(git vim)

for TOOL in $REQUIRED_TOOLS
do
	if ! [ -x "$(command -v $TOOL)" ] ; then
		echo "[e] '$TOOL' is not installed"
		exit 1;
	fi
done

echo [-] installing Vundle..
stow vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo [-] all done
