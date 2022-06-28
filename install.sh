#!/bin/bash
#
# Installs bash, zsh, vim and git configurations 
##

# backup folder
[ ! -f $HOME/.bak ] &&  mkdir $HOME/.bak

## BASH

# bashrc
[ -f $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/.bak/.bashrc
cp .bashrc $HOME

# bash_aliases
[ -f $HOME/.bash_aliases ] && mv $HOME/.bash_aliases $HOME/.bak/.bash_aliases
cp .bash_aliases $HOME

# bash_git
[ ! -f $HOME/.bash.d ] && mkdir $HOME/.bash.d
cp .bash.d/.bash_git $HOME/.bash.d

## ZSH

# zhrc
[ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.bak/.zshrc
cp .zshrc $HOME

## ALIASES
[ -f $HOME/.aliases ] && mv $HOME/.aliases $HOME/.bak/.aliases
cp .aliases $HOME

## FUNCTIONS
[ -f $HOME/.functions ] && mv $HOME/.functions $HOME/.bak/.functions
cp .functions $HOME

## VIM

# vimrc
[ -f $HOME/.vimrc ] && mv $HOME/.vimrc $HOME/.bak/.vimrc
cp .vimrc $HOME

# vim-plug
mkdir -p $HOME/.vim.d/autoload
cp .vim.d/autoload/plug.vim $HOME/.vim.d/autoload
vim +PlugInstall +qall

# startify
mkdir -p $HOME/.vim.d/plugged/vim-startify/autoload/startify/
cp .vim.d/startify/fortune.vim $HOME/.vim.d/plugged/vim-startify/autoload/startify/

## GIT

# gitconfig
[ -f $HOME/.gitconfig ] && mv $HOME/.gitconfig $HOME/.bak/.gitconfig
cp .gitconfig $HOME

## TOOLS

# omz
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.zsh.d/.oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all
