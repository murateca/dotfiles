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

mkdir $HOME/.bash.d
cp .bash.d/.bash_git $HOME/.bash.d
cp .bash_aliases $HOME
cp .bashrc $HOME

#vimrc, vim-plug and plugin installation
if [ -f $HOME/.vimrc ]; then
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi

mkdir -p $HOME/.vim.d/autoload
cp .vim.d/autoload/plug.vim $HOME/.vim.d/autoload
cp .vimrc $HOME
vim +PlugInstall +qall
mkdir -p $HOME/.vim.d/plugged/vim-startify/autoload/startify/
cp .vim.d/startify/fortune.vim $HOME/.vim.d/plugged/vim-startify/autoload/startify/

#gitconfig
if [ -f $HOME/.gitconfig ]; then
	mv $HOME/.gitconfig $HOME/.gitconfig.bak
fi
cp .gitconfig $HOME

