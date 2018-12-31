#!/bin/bash
#
#Uninstalls bash, vim and git configuraitons. Restores backups
rm -rf $HOME/.bash $HOME/.vim
rm $HOME/.bashrc $HOME/.bash_aliases $HOME/.vimrc $HOME/.gitconfig

if [ -f $HOME/.bashrc.bak ]; then		#recover the backups
	mv $HOME/.bashrc.bak $HOME/.bashrc
fi
if [ -f $HOME/.bash_aliases.bak ]; then
	mv $HOME/.bash_aliases.bak $HOME/.bash_aliases
fi
if [ -f $HOME/.vimrc.bak ]; then
	mv $HOME/.vimrc.bak $HOME/.vimrc
fi
if [ -f $HOME/.gitconfig.bak ]; then
	mv $HOME/.gitconfig.bak $HOME/.gitconfig
fi

