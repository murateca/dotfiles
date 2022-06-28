#!/bin/bash
#
# Uninstalls bash, vim and git configuraitons. Restores backups
##

# remove
rm -rf $HOME/.bash.d $HOME/.vim.d $HOME/.SpaceVim.d $HOME/.zsh.d
rm $HOME/.bashrc $HOME/.vimrc $HOME/.gitconfig $HOME/.aliases $HOME/.functions $HOME/.zshrc

# recover
if [ -f $HOME/.bak/.bashrc ]; then
	mv $HOME/.bak/.bashrc $HOME/.bashrc
fi
if [ -f $HOME/.bak/.aliases ]; then
	mv $HOME/.bak/.aliases $HOME/.aliases
fi
if [ -f $HOME/.bak/.vimrc ]; then
	mv $HOME/.bak/.vimrc $HOME/.vimrc
fi
if [ -f $HOME/.bak/.gitconfig ]; then
	mv $HOME/.bak/.gitconfig $HOME/.gitconfig
fi
if [ -f $HOME/.bak/.functions ]; then
	mv $HOME/.bak/.functions $HOME/.functions
fi
if [ -f $HOME/.bak/.zshrc ]; then
	mv $HOME/.bak/.zshrc $HOME/.zshrc
fi

# delete backup folder
rm -rf $HOME/.bak