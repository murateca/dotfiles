#!/bin/bash
#
# Install vim-plug and plugins

readonly AUTOLOAD_PATH=$HOME/.vim/autoload
readonly VIM_PLUG_URI=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $AUTOLOAD_PATH
\curl -fLo $AUTOLOAD_PATH/plug.vim $VIM_PLUG_URI
cp .vimrc $HOME
vim +PlugInstall
