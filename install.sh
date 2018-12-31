#!/bin/bash
#
#Installs bash, vim and git configurations

#bashrc, bash_aliases and bash_git
if [ -f $HOME/.bashrc ]; then			#if bashrc exists,
	mv $HOME/.bashrc $HOME/.bashrc.bak	#make it a backup
fi
if [ -f $HOME/.bash_aliases ]; then		#same for aliases
	mv $HOME/.bash_aliases $HOME/.bash_aliases.bak
fi

mkdir $HOME/.bash
cp .bash/.bash_git $HOME/.bash
cp .bash_aliases $HOME
cp .bashrc $HOME

#vimrc, vim-plug and plugin installation
if [ -f $HOME/.vimrc ]; then
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi

readonly VIM_AUTOLOAD=$HOME/.vim/autoload

mkdir -p $VIM_AUTOLOAD
cp .vim/autoload/plug.vim $VIM_AUTOLOAD
cp .vimrc $HOME
vim +PlugInstall +qall

cp .vim/startify/fortune.vim $HOME/.vim/plugged/vim-startify/autoload/startify/

#gitconfig
if [ -f $HOME/.gitconfig ]; then
	mv $HOME/.gitconfig $HOME/.gitconfig.bak
fi

