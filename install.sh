#!/bin/bash
#
# Install vim-plug and plugins

readonly AUTOLOAD_PATH=$HOME/.vim/autoload
readonly PLUGGED_PATH=$HOME/.vim/plugged
readonly VIM_PLUG_URI=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $AUTOLOAD_PATH
\curl -fLo $AUTOLOAD_PATH/plug.vim $VIM_PLUG_URI
cp .vim/.vimrc $HOME
vim +PlugInstall +qall

\cp .vim/startify/fortune.vim $PLUGGED_PATH/vim-startify/autoload/startify/
