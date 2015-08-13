#!/bin/bash
cp vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +quitall
#need git, ack, rubocop, ruby, etc(see vimrc)
