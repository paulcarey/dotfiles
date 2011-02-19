#!/bin/bash

# Run from the dotfiles directory

ln -s ~/dotfiles/.vim/vimrc ~/.vimrc
ln -s ~/dotfiles/.vim/gvimrc ~/.gvimrc
ln -s ~/dotfiles/.vim/ ~/.vim

ln -s ~/dotfiles/.editrc ~/.editrc
ln -s ~/dotfiles/.inputrc ~/.inputrc

git submodule update --init

# For Command-T
# cd ~/.vim/bundle/command-t
# rvm use system or use_leopard_ruby
# rake make
